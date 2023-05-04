class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :zip_code, null: false
      t.string :address, null: false
      t.integer :amount, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false
      t.references :provider, null: false, foreign_key: true
      t.references :rental, null: false, foreign_key: true

      t.timestamps
    end
  end
end
