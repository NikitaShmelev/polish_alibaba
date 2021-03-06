class Order < ApplicationRecord
    # has_one :status
    validates :adress, presence: true
    # belongs_to :campaign
    has_many :line_items, dependent: :destroy
    # belongs_to :user
    def sub_total
        sum = 0
        self.line_items.each do |line_item|
            sum+= line_item.total_price
        end
        return sum
    end
end
