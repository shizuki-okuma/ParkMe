class Admins::ParkingStatusesController < ApplicationController
  def create
    @parking = Parking.find(params[:parking_id])
    if @parking.update(is_active: true)
    flash[:success] = "変更しました。"
    else
    flash[:warning] = "変更できませんでした。"
    end
  end

  def destroy
    @parking = Parking.find(params[:parking_id])
    if @parking.update(is_active: false)
    flash[:success] = "変更しました。"
    else
    flash[:warning] = "変更できませんでした。"
    end
  end
end
