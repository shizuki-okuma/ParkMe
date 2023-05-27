class Providers::ParkingsController < ApplicationController
  def new
    @parking = Parking.new # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
  end

  def create
    @parking = Parking.new(parking_params) # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @parking.provider_id = current_provider.id
    if @parking.save
      
      @parking.update_parking_size(params[:parking][:car_model_ids])
      
      require "google_drive"
  
      # config.jsonを読み込んでセッションを確立
      session = GoogleDrive::Session.from_config("config.json")
      
      # スプレッドシートをURLで取得
      sp = session.spreadsheet_by_url(ENV['SHEET_URL'])
      
      # "シート1"という名前のワークシートを取得
      ws = sp.worksheet_by_title("シート1")
      
      # セルを指定して値を更新　インデックスの基準は1
      ws[@parking.id+2, 1] = @parking.id #セルA2
      ws[@parking.id+2, 2] = @parking.provider_id # セルB2
      ws[@parking.id+2, 3] = @parking.name
      ws[@parking.id+2, 4] = @parking.zip_code
      ws[@parking.id+2, 5] = @parking.address
      ws[@parking.id+2, 6] = @parking.amount
      ws[@parking.id+2, 7] = @parking.price
      ws[@parking.id+2, 8] = @parking.created_at
      ws[@parking.id+2, 9] = @parking.updated_at
      
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
    if @parking.update!(parking_params) 
      # @parking.parking_sizes.destroy_all
      # params[:parking][:car_model_ids].each do |car_model_id|
      #   # ["", "1", "2"]の""をはじく
      #   unless car_model_id.blank?
      #     parking_size = @parking.parking_sizes.new(car_model: CarModel.find(car_model_id))
      #     parking_size.save
      #   end
      # end
      @parking.update_parking_size(params[:parking][:car_model_ids])
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
      :amount, :address, :zip_code)
  end
end
