class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader

  validate :picture_size

  private
  # To be able to get the errors, disable the resize image (CarrierWave::MiniMagick) in uploaders/picture_uploaders
  # Because it will resize to the maximum size is 300x300 which might cause the image size smaller than its originial
  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "Should be less than 3MB")
    end
  end
end
