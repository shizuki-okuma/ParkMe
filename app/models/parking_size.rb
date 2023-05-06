class ParkingSize < ApplicationRecord
  belongs_to :car_model, dependent: :destroy
  belongs_to :parking, dependent: :destroy
end
