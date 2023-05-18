class CreateRentalPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :rental_prices do |t|
      t.integer :price
      t.string :zip_code
      t.string :average_price

      t.timestamps
    end
  end
end
