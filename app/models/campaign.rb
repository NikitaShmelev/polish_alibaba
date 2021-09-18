class Campaign < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable, :lockable,
  validates :nip, length: {is: 10}, allow_blank: false, 
            :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9999999999 }
  validates :email, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  validates :description, uniqueness: false, presence: true, allow_blank: false,
            length: {minimum: 100, maximum: 1024}
end
