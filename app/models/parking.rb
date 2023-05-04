class Parking < ApplicationRecord
  belongs_to :provider
  belongs_to :rental
end
