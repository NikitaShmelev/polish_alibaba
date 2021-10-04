class Order < ApplicationRecord
    has_one :status
    validates :delivery_adress, presence: true
    # belongs_to :campaign
    # has_many :line_items, dependent: :destroy
    # belongs_to :user
end
