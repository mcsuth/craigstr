class RemoveLocationCodeFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :location_code
  end

  def down
    add_column :tracks, :location_code, :string
  end
end
