#管理者側のログインID
# Admin.create!(
#    email: 'admin@admin',
#    password: 'testtest'
# )

#車種をチェックボックスを使って表示する
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