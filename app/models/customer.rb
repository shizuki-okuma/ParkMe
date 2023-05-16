class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  
  has_many :rentals, dependent: :destroy
  has_many :parkings, through: :rentals
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.first_name = "ト" 
      customer.last_name = "ゲス" 
      customer.first_name_kana = "ト"
      customer.last_name_kana = "ゲス"
      customer.zip_code = "123123"
      customer.address = "東京都杉並区〇〇"
      customer.phone_number = "08012341234"
      customer.is_deleted = "false"
    end
  end
end
