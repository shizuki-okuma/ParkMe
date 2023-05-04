class Providers::ProvidersController < ApplicationController
  def show
    @provider = Provider.find(current_provider.id)
  end

  def edit
    @provider =Provider.find(current_provider.id)
  end

  def update
    @provider = Provider.find(current_provider.id)
    if @provider.update(provider_params)
      redirect_to '/providers/my_page'
    else
      render :edit
    end
  end

  def quit
  end

  def destroy
    @provider = current_provider
    @provider.update(is_deleted: false)
     reset_session
     redirect_to root_path
  end
  
  private

  def provider_params
    params.require(:provider).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :is_deleted)
  end
end
