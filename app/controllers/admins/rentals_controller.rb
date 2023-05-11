class Admins::RentalsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
      redirect_to admin_customer_path
  end
end
