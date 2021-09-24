class Product < ApplicationRecord
  # mount_uploaders :image, ImageUploader
  # belongs_to :campaign
  has_many_attached :images 
end
