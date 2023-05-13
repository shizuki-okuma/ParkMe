class Customers::RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @customer = current_customer
    @parking = Parking.find(params[:parking_id])
    @beginning_of_month = Time.zone.now.beginning_of_month
    @end_of_month = Time.zone.now.end_of_month
    @beginning_end_month = @beginning_of_month..@end_of_month
    Customer.where(created_at: @beginning_of_month..@end_of_month)
  end

  def confirm
    @rental = Rental.new(rental_params)
    @customer = current_customer
    @total = 0
    @parking = Parking.find(params[:parking_id])
    
  end

  def thanks
  end

  def create
    parking = Parking.find(params[:rental][:parking_id])
    rental = current_customer.rentals.new(rental_params)
    rental.status = 0
    rental.price = parking.price
    rental.amount = parking.amount
    rental.save
    redirect_to thanks_customers_rentals_path
  end

  def index
    @rental = current_customer.rentals
  end

  def show
    @rental = current_customer.rentals.find(params[:id])
    @parking = @rental.parking
  end
  
private

  def rental_params
    params.require(:rental).permit(:customer_id, :parking_id, :rental_at, :is_canceled, :total_payment, :payment_method, :name, :address, :zip_code, :status)
  end
end
