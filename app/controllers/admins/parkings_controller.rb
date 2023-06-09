class Admins::ParkingsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @parkings = Parking.all
  end

  def show
    @parking = Parking.find(params[:id])
  end

  def update
    @parking = Parking.find(current_parking.id)
    if @parking.update(parking_params)
      redirect_to admins_parkings_show_path, success: "変更を完了しました。"
    else
      render :edit, warning: "変更できませんでした。"
    end
  end
end
