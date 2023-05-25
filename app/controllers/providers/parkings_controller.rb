class Providers::ParkingsController < ApplicationController
  def new
    @parking = Parking.new # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
  end

  def create
    @parking = Parking.new(parking_params) # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @parking.provider_id = current_provider.id
    if @parking.save
      redirect_to providers_parking_path(@parking), success: "登録を完了しました。"
    else
      render :new , warning: "登録ができませんでした。"
    end
    # require "google_drive"

    # # config.jsonを読み込んでセッションを確立
    # session = GoogleDrive::Session.from_config("config.json")
    
    # # スプレッドシートをURLで取得
    # sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/16am8DVhp95Ijvg-pUVUtZIrudrf0Fogn0cbXkJ9tIqc/edit?usp=sharing")
    
    # # "シート1"という名前のワークシートを取得
    # ws = sp.worksheet_by_title("シート2")
    
    
    
    # # セルを指定して値を更新　インデックスの基準は1
    # ws[2, 1] = "provoder_id" # セルA2
    # ws[2, 2] = "parking_id" # セルB2
    # ws[2, 3] = "name"
    # ws[2, 4] = "zip_code"
    # ws[2, 5] = "address"
    # ws[2, 6] = "amount"
    # ws[2, 7] = "price"
    # ws[2, 8] = "create_at"
    # ws[2, 9] = "update_at"
    
    # # saveで変更を保存、実際にスプレッドシートに反映させる
    # ws.save
  end

  def edit
    @parking = Parking.find(params[:id]) # テーブルからレコードを1行取得
  end

  def update
    @parking = Parking.find(params[:id])
    if @parking.update(parking_params) 
      redirect_to providers_parking_path(@parking), success: "変更を完了しました。"
    else
      render :edit, warning: "変更できませんでした。"
    end
  end

  def show
    @parking = Parking.find(params[:id])
  end
  
  private

  def parking_params # requireメソッドでオブジェクト名を指定,permitメソッドでキーを指定
    params.require(:parking).permit(
      :name, :description, :price, :is_active,
      :amount, :address, :zip_code, car_model_ids:[]) #idsにすることで複数台のコレクションチェックボックスから複数データを送ることが可能
  end
end
