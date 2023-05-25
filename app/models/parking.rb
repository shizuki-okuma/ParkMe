class Parking < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  validates :price, presence: true

  has_many :parking_sizes, dependent: :destroy
  has_many :car_models, through: :parking_sizes
  has_many :rentals, dependent: :destroy
  belongs_to :provider
  
  
  def with_tax_price
      (price * 1.1).floor
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      Parking.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      Parking.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      Parking.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      Parking.where("name LIKE?","%#{word}%")
    else
      Parking.all
    end
  end
  
  def self.looks_zipcode(search, word)
    if search == "perfect_match"
      Parking.where("zip_code LIKE?", "#{word}")
    elsif search == "forward_match"
      Parking.where("zip_code LIKE?","#{word}%")
    elsif search == "backward_match"
      Parking.where("zip_code LIKE?","%#{word}")
    elsif search == "partial_match"
      Parking.where("zip_code LIKE?","%#{word}%")
    else
      Parking.all
    end
  end
  
  def subtotal
    price*amount
  end
  
end
