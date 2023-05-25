require "google_drive"

# config.jsonを読み込んでセッションを確立
session = GoogleDrive::Session.from_config("config.json")

# スプレッドシートをURLで取得
sp = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/16am8DVhp95Ijvg-pUVUtZIrudrf0Fogn0cbXkJ9tIqc/edit?usp=sharing")

# "シート1"という名前のワークシートを取得
ws = sp.worksheet_by_title("シート2")

# セルを指定して値を更新　インデックスの基準は1
ws[2, 1] = "provoder_id" # セルA2
ws[2, 2] = "parking_id" # セルB2

# saveで変更を保存、実際にスプレッドシートに反映させる
ws.save