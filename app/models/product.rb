class Product < ApplicationRecord
  # mount_uploaders :image, ImageUploader
  belongs_to :campaign
  has_many_attached :images, dependent: :destroy
  validates :category_id, presence: true
  validates :sub_category_id, presence: true
  validates :title, presence: true
  validates :image_url, presence: true
  has_one :category
  has_one :sub_category
end
