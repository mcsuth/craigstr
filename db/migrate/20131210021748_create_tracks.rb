class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :low_cost
      t.integer :high_cost
      t.string :location
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :email
      t.boolean :text

      t.timestamps
    end
  end
end
