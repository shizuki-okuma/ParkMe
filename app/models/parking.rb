class Parking < ApplicationRecord
  belongs_to :provider, dependent: :destroy
  belongs_to :rental, dependent: :destroy
  has_many :rental_detail, dependent: :destroy
  has_many :parking_size, dependent: :destroy

def with_tax_price
    (price * 1.1).floor
end
end
