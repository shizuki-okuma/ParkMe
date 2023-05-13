class Provider < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :parkings, dependent: :destroy
  
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
