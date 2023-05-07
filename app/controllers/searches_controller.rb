class SearchesController < ApplicationController
  
  def index
    # byebug
    @range = params[:range]
      if @range == "駐車場"
        @parkings = Parking.looks(params[:search],params[:word])
        # byebug
      else
        @car_models = CarModel.looks(params[:search],params[:word])
      end
    # @car_models = CarModel.all
    # @parkings = Parking.all
  end
end

