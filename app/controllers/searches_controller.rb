class SearchesController < ApplicationController
  
  def index
    @range = params[:range]
      if @range == "駐車場"
        @parkings = Parking.looks(params[:search],params[:word])
      else
        @car_models = CarModel.looks(params[:search],params[:word])
      end
  end
end

