class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.text :description
      t.datetime :time
      t.integer :channel_id
      t.integer :viewing_locations_id

      t.timestamps
    end
  end
end
