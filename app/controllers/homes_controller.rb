class HomesController < ApplicationController
  def top
    @car_models = CarModel.all
  end
end