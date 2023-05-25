class Providers::ParkingsController < ApplicationController
  def new
    @parking = Parking.new # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
  end

  def create
    @parking = Parking.new(parking_params) # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @parking.provider_id = current_provider.id
    if @parking.save
      require "google_drive"

    # config.jsonを読み込んでセッションを確立
    session = GoogleDrive::Session.from_config("config.json")
    
    # スプレッドシートをURLで取得
    sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/16am8DVhp95Ijvg-pUVUtZIrudrf0Fogn0cbXkJ9tIqc/edit?usp=sharing")
    
    # "シート1"という名前のワークシートを取得
    ws = sp.worksheet_by_title("シート2")
    
    
    
    # セルを指定して値を更新　インデックスの基準は1
    ws[@parking.id+1, 1] = @parking.id #セルA2
    ws[@parking.id+1, 2] = @parking.provider_id # セルB2
    ws[@parking.id+1, 3] = @parking.name
    ws[@parking.id+1, 4] = @parking.zip_code
    ws[@parking.id+1, 5] = @parking.address
    ws[@parking.id+1, 6] = @parking.amount
    ws[@parking.id+1, 7] = @parking.price
    ws[@parking.id+1, 8] = @parking.created_at
    ws[@parking.id+1, 9] = @parking.updated_at
    
    # saveで変更を保存、実際にスプレッドシートに反映させる
    ws.save
    
      redirect_to providers_parking_path(@parking), success: "登録を完了しました。"
    else
      render :new , warning: "登録ができませんでした。"
    end
    
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
