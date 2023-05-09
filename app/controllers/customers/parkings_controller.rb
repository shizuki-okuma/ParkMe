class Customers::ParkingsController < ApplicationController
  def show
    @parking = Parking.find(params[:id])
    @rental = Rental.new
  end

  def index
    @parkings = Parking.all
  end
end
