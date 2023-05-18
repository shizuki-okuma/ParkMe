class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  
  
  def after_sign_in_path_for(resource)
    if customer_signed_in?
       my_page_customers_customers_path
    else provider_signed_in?
       my_page_providers_providers_path
    end
  end
end
