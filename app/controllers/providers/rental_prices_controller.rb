class Providers::RentalPricesController < ApplicationController
  def index
    if params[:zip_code].present?
    @rental_prices = RentalPrice.where(region: params[:zip_code])
    else
    @rental_prices = RentalPrice.all
    end
  end
end
