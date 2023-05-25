class Providers::SessionsController < Devise::SessionsController
  
  before_action :provider_state, only: [:create]
  
  def guest_sign_in
    provider = Provider.guest
    sign_in provider
    redirect_to my_page_providers_providers_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def provider_state
    @provider = Provider.find_by(email: params[:provider][:email])
    return if !@provider
    if @provider.is_deleted && @provider.valid_password?(params[:provider][:password])
      redirect_to new_provider_registration_path
    end
  end
end
