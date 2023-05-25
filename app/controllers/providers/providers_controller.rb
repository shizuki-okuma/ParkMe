class Providers::ProvidersController < ApplicationController
  before_action :ensure_guest_provider, only: [:edit]
  def show
    @provider = Provider.find(current_provider.id)
    # @rentals = @provider.rentals.page(params[:page]).per(10)
    @parkings = Parking.where(provider_id: current_provider.id) #登録した駐車場のみを表示
    @all_parkings = Parking.where(id: @parkings.pluck(:id)).joins(:rentals).order(:rental_id).uniq
  end
  
  def edit
    @provider =Provider.find(current_provider.id)
  end

  def update
    @provider = Provider.find(current_provider.id)
    if @provider.update(provider_params)
      redirect_to '/providers/providers/my_page', success: "変更を完了しました。"
    else
      flash.now[:alert] = "変更ができませんでした。"
      render :edit
    end
  end

  def withdraw
    @provider = current_provider
    @provider.update(is_deleted: true)
     reset_session
     redirect_to root_path
  end
  
  private

  def provider_params
    params.require(:provider).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :is_deleted)
  end
  
  def ensure_guest_provider
    @provider = Provider.find(params[:id])
    if @provider.email == 'guest@example.com'
      redirect_to my_page_providers_providers_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end