class CreateRentalPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :rental_prices do |t|
      t.integer :price, null: false
      t.string :zip_code, null: false
      t.timestamps
    end
  end
end
