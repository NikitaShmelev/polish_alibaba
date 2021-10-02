class Category < ApplicationRecord
    has_many :sub_categories
    validates :image_url, presence: true
end
