class Admin < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :password, presence: true
  validates :email, presence: true
end
