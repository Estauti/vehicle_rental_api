class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :licence_plate
      t.integer :model_year
      t.integer :manufacture_year
      t.boolean :active

      t.timestamps
    end
  end
end
