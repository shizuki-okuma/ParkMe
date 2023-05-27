class RemoveAmountFromParkingSizes < ActiveRecord::Migration[6.1]
  def change
    remove_column :parking_sizes, :amount, :integer
  end
end
