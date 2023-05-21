class CarModel < ApplicationRecord
  validates :name, presence: true
  
  def self.looks(search, word)
    if search == "perfect_match"
      @car_model = CarModel.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @car_model = CarModel.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @car_model = CarModel.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @car_model = CarModel.where("name LIKE?","%#{word}%")
    else
      @car_model = CarModel.all
    end
  end
end
