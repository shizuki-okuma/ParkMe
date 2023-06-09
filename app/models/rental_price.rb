class RentalPrice < ApplicationRecord
  has_many :rentals
  has_many :parkings, through: :rental
  #has_many :rental_parkings
  
  
  def average_price(zip_code)
    # 右側→特定のzip_codeにたいして,どのzip_codeが何個あるか
    # Parking.where(zip_code: zip_code).joins(:rentals).group(:zip_code).count.values[0]
    # ex. {"123123"=>7} → 7
    # 
    # Parking.all.joins(:rentals).pluck(:total_payment).sum
    # ex 7700
    parkings = Parking.where(zip_code: zip_code)
    return nil if parkings.map{|parking| parking.rentals.size }.sum == 0
    parkings.joins(:rentals).pluck(:total_payment).sum / parkings.joins(:rentals).group(:zip_code).count.values[0]
  end
end
