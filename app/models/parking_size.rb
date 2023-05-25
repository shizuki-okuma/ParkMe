class ParkingSize < ApplicationRecord
  validates :amount, presence: true
  
  belongs_to :car_model
  belongs_to :parking
end
