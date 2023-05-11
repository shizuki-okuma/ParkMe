# 管理者側のログインID
# Admin.create!(
#     email: 'admin@admin',
#     password: 'testtest'
# )

#車種をチェックボックスを使って表示する
# CarModel.create!(
#   [
#     {
#       name: '軽自動車'
#     },
#     {
#       name: 'トラック'
#     },
#     {
#       name: 'コンパクトカー'
#     },
#     {
#       name: '中型車'
#     },
#     {
#       name: 'バイク'
#     },
#     {
#       name: 'ワンボックス'
#     }
#     ]
# )
# provider = Provider.create!(
#     last_name: '田中',
#     first_name: '太郎',
#     last_name_kana: 'タナカ',
#     first_name_kana: 'タロウ',
#     email: 'tanaka@gmail.com',
#     password: 'tanaka',
#     zip_code: '123123',
#     address: '東京都杉並区123123',
#     phone_number: '123123',
#     is_deleted: false 
# )
# provider = Provider.last
# provider.parkings.build(
#   name: "田中の東京の駐車場",                                  
#   description: "広い",                                         
#   zip_code: "123123",                                          
#   address: "東京都杉並区",                                     
#   amount: 1,                                                   
#   price: 1000,                                                 
#   is_active: true
# )

# provider.save!