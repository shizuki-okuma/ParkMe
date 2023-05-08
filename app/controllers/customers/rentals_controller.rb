class Customers::RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def confirm
    @rental = Rental.new(rental_params)
    @total = 0
  end

  def thanks
  end

  def create
    rental = current_customer.rentals.new(rental_params)
    rental.status = 0
    rental.save
    current_customer.parking.each do |parking|
      rental_parking = RentalParking.new(
        rental_id: rental.id,
        parking_id: parking.id,
        price: parking_price,
        amount: parking_amount,
        making_status: 0)
    rental_parking.save
    parking.destroy
    end
  redirect_to orders_thanks_path
  end

  def index
     
     
     
  end

  def show
    @rental = Rental.find(params[:id])
    @total = 0
  end
  
private

  def rental_params
    params.require(:order).permit(:customer_id, :total_payment, :payment_method, :name, :address, :zip_code, :status)
  end
end
