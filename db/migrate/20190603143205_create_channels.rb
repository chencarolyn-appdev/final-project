class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :channel_number

      t.timestamps
    end
  end
end
