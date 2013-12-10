class Track < ActiveRecord::Base
  attr_accessible :email, :end_date, :high_cost, :location, :low_cost, :start_date, :text, :title, :user_id
end
