class Rental < ApplicationRecord
  belongs_to :rental_detail
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
end
