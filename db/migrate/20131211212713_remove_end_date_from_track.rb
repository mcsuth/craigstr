class RemoveEndDateFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :end_date
  end

  def down
    add_column :tracks, :end_date, :datetime
  end
end
