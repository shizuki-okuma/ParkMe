class Parking < ApplicationRecord
  has_many :rental_details, dependent: :destroy
  has_many :parking_sizes, dependent: :destroy
  has_many :car_models, through: :parking_sizes
def with_tax_price
    (price * 1.1).floor
end
end
