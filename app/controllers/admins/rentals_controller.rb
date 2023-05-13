class Admins::RentalsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @rentals = Rental.all
    
  end
  
  def show
    @parking = current_customer.parking.find(params[:id])
  end
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
      redirect_to admin_customer_path
  end
end
