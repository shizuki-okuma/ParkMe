class HomesController < ApplicationController
  def top
    @car_models = CarModel.all
    @parkings = Parking.all
  end
end