class Customers::SessionsController < Devise::SessionsController
  
  before_action :customer_state, only: [:create]
  
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to my_page_customers_customers_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.present? && @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == true
      # 退会済み
      redirect_to new_customer_registration_path
    end
  end
end
