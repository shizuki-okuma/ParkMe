class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.boolean :is_active, default: true
      t.string :zip_code, null: false
      t.string :address, null: false
      t.integer :amount, null: false
      t.references :customer, null: false, foreign_key: true
      t.references :car_model, null: false, foreign_key: true
      t.timestamps
    end
  end
end
