class CreateViewingLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :viewing_locations do |t|
      t.string :location_name
      t.string :location_address

      t.timestamps
    end
  end
end
