class AddViewingLocationtofavoriteShows < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_shows, :viewing_location_id, :integer
  end
end
