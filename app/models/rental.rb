class Rental < ApplicationRecord
  # validates :rental_at, presence: true
  # validates :payment_method, presence: true
  # validates :total_payment, presence: true
  # validates :status, presence: true
  # validates :price, presence: true
  # validates :amount, presence: true
  
  belongs_to :customer
  belongs_to :parking
  belongs_to :rental_price
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { rentaled: 0 , rental: 1 , cancel: 2 }
end