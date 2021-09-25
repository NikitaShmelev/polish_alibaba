class Order < ApplicationRecord
    has_one :status
    validates :delivery_adress, presence: true
    # belongs_to :campaign
    # belongs_to :user
end
