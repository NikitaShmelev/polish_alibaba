class Campaign < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable, :lockable,
  validates :nip, length: {is: 10}, allow_blank: false, 
            :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9999999999 }
  validates :email, uniqueness: true, presence: true
  validates :campaign_name, uniqueness: true, presence: true
  validates :description, uniqueness: false, presence: false, allow_blank: false,
            length: {minimum: 100, maximum: 1024}
  validates :short_description, uniqueness: false, presence: true, allow_blank: false,
            length: {minimum: 50, maximum: 300}
  validates :first_adress_line, presence: true
  validates :second_adress_line, presence: false
  validates :zip_code, presence: true
  validates :contact_phone_number, presence: true#, length: {is: 9}
  validates :area_code, presence: true
  has_many :products
  has_one :logo
end
