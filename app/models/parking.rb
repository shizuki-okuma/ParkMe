class Parking < ApplicationRecord
  belongs_to :provider
  belongs_to :rental
  has_many :car_models, dependent: :destroy
  has_many :rental_details, dependent: :destroy
end
