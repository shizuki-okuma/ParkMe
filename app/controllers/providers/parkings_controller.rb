class Providers::ParkingsController < ApplicationController
  def new
    @parking = Parking.new # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
  end

  def create
    @parking = Parking.new(parking_params) # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    if @parking.save
      redirect_to parking_path(@parking) #保存成功時showページへ移動
    else
      render :new #保存失敗時newページへ移動
    end
  end

  def edit
    @parking = Parking.find(params[:id]) # テーブルからレコードを1行取得
  end

  def update
    @parking = Parking.find(params[:id])
    if @parking.update(parking_params) 
      redirect_to admin_parking_path(@parking) #編集保存成功時showページへ移動
    else
      render :edit #編集保存成功時editページへ移動
    end
  end

  def show
    @parking = Parking.find(params[:id])
  end
  
  private

  def parking_params
    params.require(:parking).permit(
      :name, :description, :car_model_id, :price, :is_active,
      :amount, :address, :zip_code, :provider_id) # requireメソッドでオブジェクト名を指定,permitメソッドでキーを指定
  end
end
