class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :parking
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { rentaled: 0 , rental: 1 , cancel: 2 }
  # enum cancel: { キャンセル: true, レンタル: false }
  
end