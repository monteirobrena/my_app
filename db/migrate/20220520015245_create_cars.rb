class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :model
      t.string :license_plage

      t.timestamps
    end
  end
end
