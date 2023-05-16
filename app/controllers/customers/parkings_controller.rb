class Customers::ParkingsController < ApplicationController
  def show
    @parking = Parking.find(params[:id])
    # @rental = current_customer.rentals.find(params[:id])
    # @parking = @rental.parking
  end

  def index
    @parkings = Parking.all
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :is_deleted)
  end
  
end
