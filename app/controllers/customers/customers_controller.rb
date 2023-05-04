class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer =Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to '/customers/my_page'
    else
      render :edit
    end
  end

  def quit
  end

  def destroy
    @customer = current_customer
    @customer.update(is_deleted: false)
     reset_session
     redirect_to root_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :is_deleted)
  end
end