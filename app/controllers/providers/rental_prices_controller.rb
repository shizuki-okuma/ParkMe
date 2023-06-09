class Providers::RentalPricesController < ApplicationController
  def index
    # @rental_prices = RentalPrice.all
    if params[:zip_code].present?
      @rental_prices = RentalPrice.where(zip_code: params[:zip_code]).group(:zip_code)
      # @zip_code = params[:zip_code]
    else
      @rental_prices = RentalPrice.all.group(:zip_code)
    
    end
  end
end
