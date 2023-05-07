class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    if @range == "Parking"
      @parkings = Parking.looks(params[:search],params[:word])
    else
      @car_models = CarModel.looks(params[:search],params[:word])
    end
  end
end

