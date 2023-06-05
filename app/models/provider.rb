class Provider < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  
  has_many :parkings, dependent: :destroy
  
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.first_name = "ト" 
      customer.last_name = "ゲス" 
      customer.first_name_kana = "ト"
      customer.last_name_kana = "ゲス"
      customer.zip_code = "1660016"
      customer.address = "東京都杉並区成田西4-3"
      customer.phone_number = "08000000000"
      customer.is_deleted = "false"
    end
  end
end
