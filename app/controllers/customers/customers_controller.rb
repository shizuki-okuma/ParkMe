class Customers::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]
  def show
    @customer = current_customer
    @rentals = current_customer.rentals
    @parking = current_customer.parkings
  end

  def edit
    @customer =Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to '/customers/customers/my_page', success: "変更を完了しました。"
    else
      flash.now[:alert] = "変更ができませんでした。"
      render :edit
    end
  end

  def quit
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: false)
     reset_session
     redirect_to root_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :is_deleted)
  end
  
  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.email == 'guest@example.com'
      redirect_to my_page_customers_customers_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
  
  
end