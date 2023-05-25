class CreateParkingStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_statuses do |t|

      t.timestamps
    end
  end
end
