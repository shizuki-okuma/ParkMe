class CarModel < ApplicationRecord
  
  has_many :parking_size, dependent: :destroy
end
