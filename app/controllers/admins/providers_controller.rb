class Admins::ProvidersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
  end
  
  def update
    @provider = Provider.find(params[:id])
    if  @provider.update(provider_params)
      redirect_to admin_provider_path, success: "変更を完了しました。"
    else
      flash.now[:alert] = "変更ができませんでした。"
      render :edit
    end
  end
  
  private

  def provider_params
    params.require(:provider).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :is_deleted)
  end
end
