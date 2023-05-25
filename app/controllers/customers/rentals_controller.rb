class Customers::RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @customer = current_customer
    @parking = Parking.find(params[:parking_id])
    @rental.parking = @parking
    @beginning_of_month = Time.zone.now.beginning_of_month
    @end_of_month = Time.zone.now.end_of_month
    @beginning_end_month = @beginning_of_month..@end_of_month
    Customer.where(created_at: @beginning_of_month..@end_of_month)
    
  end
  
  def create
    parking = Parking.find(params[:rental][:parking_id])
    rental = current_customer.rentals.new(rental_params)
    rental.status = 0
    rental.price = parking.price
    rental.amount = parking.amount
    rental_price = RentalPrice.new(price: parking.price, zip_code: parking.zip_code)
    rental.rental_price = rental_price
    rental.save
    
    redirect_to thanks_customers_rentals_path
  end
  
  def confirm
    @customer = current_customer
    @parking = Parking.find(params[:parking_id])
    
    @rental = Rental.new(rental_params)#パーキングが入ってるか確認
    @rental.customer_id = current_customer.id
    @rental.parking = @parking
    @rental_price = RentalPrice.new(price: @parking.price, zip_code: @parking.zip_code)
    @rental.rental_price = @rental_price
    @total=@parking.with_tax_price
  end

  def thanks
  end

  def index
    @rental = current_customer.rentals
  end

  def show
    @rental = Rental.find(params[:id])
    @parking = @rental.parking
  end
  
  def cancel
    @rental = Rental.find(params[:id])
    @rental.status = :cancel
    @rental.save!
    redirect_to  my_page_customers_customers_path, notice:'キャンセルしました。'
  end
  def update
    @rental = Rental.find(params[:id])
    @rental.status = params[:status].to_i
    @rental.save
    redirect_to  my_page_customers_customers_path, notice:'変更しました。'
  end
private

  def rental_params
    params.require(:rental).permit(:customer_id, :parking_id, :rental_at, :is_canceled, :total_payment, :payment_method, :name, :address, :zip_code, :status)
  end
end
