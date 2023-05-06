class CreateParkingSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_sizes do |t|
      t.integer :amount
      t.references :car_model, null: false, foreign_key: true
      t.references :parking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
