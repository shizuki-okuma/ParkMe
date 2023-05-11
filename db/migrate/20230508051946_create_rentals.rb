class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.references :parking, null: false
      t.datetime :rental_at, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false
      t.integer :status, null: false
      t.boolean :is_canceled, null: false, default: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
