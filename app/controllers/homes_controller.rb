class HomesController < ApplicationController
  def top
    # @range = params[:range]
    # if @range == "Parking"
    #   @parkings = Parking.looks(params[:search],params[:word])
    # else
    #   @car_models = CarModel.looks(params[:search],params[:word])
    # end
    
    @car_models = CarModel.all
    @parkings = Parking.all
  end
end