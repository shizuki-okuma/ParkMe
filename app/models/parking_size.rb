class ParkingSize < ApplicationRecord
  belongs_to :car_model
  belongs_to :parking
end
