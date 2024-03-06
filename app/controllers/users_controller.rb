class UsersController < ApplicationController
  def index
    render json: User.all, status: :ok
  end

  def create
    user = User.new(username: params[:username])

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # def upload_image
  #   user = User.find(params[:user_id])

  #   if user.image.attach(params[:image])
  #     render json: { message: "Image uploaded" }, status: :ok
  #   else
  #     render json: { message: "Image upload failed"}, status: :unprocessable_entity
  #   end
  # end

  def upload_image
    user = User.find(params[:user_id])

    if params[:image] && user.image.attach(params[:image])
      render json: { message: "Image uploaded", url: rails_blob_url(user.image, only_path: false) }, status: :ok
    else
      render json: { message: "Image upload failed" }, status: :unprocessable_entity
    end
  end
end
