class Parking < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :is_active, presence: true

  has_many :parking_sizes, dependent: :destroy
  has_many :car_models, through: :parking_sizes
  has_many :rentals, dependent: :destroy
  belongs_to :provider
  
  def update_parking_size(updated_car_model_ids)
    # やること:
    # car_model_ids(["", "1", "2"])を引数として受け取り
    # 登録されていないものは作成,なくなったものは削除を行う
    
    updated_car_model_ids = updated_car_model_ids.select{ |x| x.present? }.map{ |x| x.to_i }
    
    # なくなったものは削除
    if parking_sizes.present?
      parking_sizes.each do |exist_parking_size|
        exist_car_model = exist_parking_size.car_model
        unless updated_car_model_ids.include?(exist_car_model.id)
          exist_parking_size.destroy
        end
      end
    end
    
    # 登録されていないものを作成
    updated_car_model_ids.each do |car_model_id|
      if car_models.find_by(id: car_model_id).nil?
        parking_size = parking_sizes.new(car_model: CarModel.find(car_model_id))
        parking_size.save
      end
    end
    
  end
  
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
