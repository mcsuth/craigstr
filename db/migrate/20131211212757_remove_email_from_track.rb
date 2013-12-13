class RemoveEmailFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :email
  end

  def down
    add_column :tracks, :email, :string
  end
end
