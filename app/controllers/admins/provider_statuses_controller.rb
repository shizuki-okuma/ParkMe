class Admins::ProviderStatusesController < ApplicationController
  def create
    @provider = Provider.find(params[:provider_id])
    if @provider.update(is_deleted: false)
    flash[:success] = "変更しました。"
    else
    flash[:warning] = "変更できませんでした。"
    end
  end

  def destroy
    @provider = Provider.find(params[:provider_id])
    if @provider.update(is_deleted: true)
    flash[:success] = "変更しました。"
    else
    flash[:warning] = "変更できませんでした。"
    end
  end
end
