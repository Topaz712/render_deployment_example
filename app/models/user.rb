class User < ApplicationRecord
  has_one_attached :image

  def upload_image
    user = User.find(params[:user_id])

    if user.image.attach(params[:image])
      render json: { message: "Image uploaded" }, status: :ok
    else
      render json: { message: "Image upload failed"}, status: :unprocessable_entity
    end
  end
end
