Admin.create!(
    email: 'admin@admin',
    password: 'testtest'
)

CarModel.create!(
  [
    {
      name: '軽自動車'
    },
    {
      name: 'トラック'
    },
    {
      name: 'コンパクトカー'
    },
    {
      name: '中型車'
    },
    {
      name: 'バイク'
    },
    {
      name: 'ワンボックス'
    }
    ]
)

provider = Customer.create!(
    last_name: '佐々木',
    first_name: '太郎',
    last_name_kana: 'ササキ',
    first_name_kana: 'タロウ',
    email: 'sasaki@gmail.com',
    password: 'sasaki',
    zip_code: '430-0936',
    address: '静岡県浜松市中区大工町６１−１',
    phone_number: '08000000000',
    is_deleted: false 
)


provider = Provider.create!(
    last_name: '田中',
    first_name: '太郎',
    last_name_kana: 'タナカ',
    first_name_kana: 'タロウ',
    email: 'tanaka@gmail.com',
    password: 'tanaka',
    zip_code: '166-0016',
    address: '東京都杉並区東京都杉並区成田西4-6',
    phone_number: '08000000000',
    is_deleted: false 
)
provider = Provider.last
provider.parkings.build(
  name: "田中の東京の駐車場",                                  
  description: "広い",                                         
  zip_code: "166-0016",                                          
  address: "東京都杉並区東京都杉並区成田西4-6",                                     
  amount: 1,                                                   
  price: 1000,                                                 
  is_active: true
)

provider.save!
