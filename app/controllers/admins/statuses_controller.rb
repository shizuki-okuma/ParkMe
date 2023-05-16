class Admins::StatusesController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    if @customer.update(is_deleted: false)
    flash[:success] = "変更しました。"
    else
    flash[:warning] = "変更できませんでした。"
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    if @customer.update(is_deleted: true)
    flash[:success] = "変更しました。"
    else
    flash[:warning] = "変更できませんでした。"
    end
  end
end
