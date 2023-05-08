class Customers::ParkingsController < ApplicationController
  def show
    @parking = Parking.find(params[:id])
    @rental = Rental.new
  end

  def index
  end
end
