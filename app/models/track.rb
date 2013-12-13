class Track < ActiveRecord::Base
  attr_accessible :location_code, :high_cost, :location, :low_cost, :title, :user_id, :url

  def high_cost=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:high_cost] = num.to_i
  end

  def low_cost=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:low_cost] = num.to_i
  end

end
