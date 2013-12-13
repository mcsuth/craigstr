class RemoveTextFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :text
  end

  def down
    add_column :tracks, :text, :string
  end
end
