class RemoveStartDateFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :start_date
  end

  def down
    add_column :tracks, :start_date, :datetime
  end
end
