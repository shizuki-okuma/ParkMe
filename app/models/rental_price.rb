class RentalPrice < ApplicationRecord
  has_many :rentals
  has_many :parkings, through: :rental
  has_many :rental_parkings
  
end
