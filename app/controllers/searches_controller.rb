class SearchesController < ApplicationController
  
  def index
    
    @range = params[:range]
      if @range == "駐車場名"
        @parkings = Parking.looks(params[:search],params[:word])
      elsif @range == "郵便番号"
        @parkings = Parking.looks_zipcode(params[:search],params[:word])
      else
        car_models = CarModel.looks(params[:search],params[:word])
        
        # 複数の車種に対して駐車場が複数存在するので2重ループ
        @parkings = [] # 空の配列
        car_models.each do |car_model|
          car_model.parkings.each do |parking|
            @parkings << parking # インスタンス変数にループの結果を詰め込む
          end
        end
        
        @parkings.uniq! # 同じレコード(駐車場)を除外する
      end
  end
end