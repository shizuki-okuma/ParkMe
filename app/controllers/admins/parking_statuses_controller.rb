class Admins::ParkingStatusesController < ApplicationController
  def create
    @parking = Parking.find(params[:parking_id])
    @parking.update(is_active: true)
  end

  def destroy
    @parking = Parking.find(params[:parking_id])
    @parking.update(is_active: fa)
  end
end
