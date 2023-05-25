class SearchesController < ApplicationController
  
  def index
    
    @range = params[:range]
      if @range == "駐車場名"
        @parkings = Parking.looks(params[:search],params[:word])
      elsif @range == "郵便番号"
        @parkings = Parking.looks_zipcode(params[:search],params[:word])
      else
        @car_models = CarModel.looks(params[:search],params[:word])
      end
  end
end