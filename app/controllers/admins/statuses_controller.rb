class Admins::StatusesController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @customer.update(is_deleted: false)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @customer.update(is_deleted: true)
  end
end
