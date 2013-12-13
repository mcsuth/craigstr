class AddLocationCodeToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :location_code, :string
  end
end
