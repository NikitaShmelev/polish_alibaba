class Product < ApplicationRecord
  # mount_uploaders :image, ImageUploader
  belongs_to :campaign
  has_many_attached :images, dependent: :destroy
  has_one :category
end
