class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if  @customer.update(customer_params)
      redirect_to admin_customer_path, success: "変更を完了しました。"
    else
      flash.now[:alert] = "変更ができませんでした。"
      render :edit
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :is_deleted)
  end
end
