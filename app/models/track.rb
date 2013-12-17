class Track < ActiveRecord::Base
  attr_accessible :location_code, :high_cost, :location, :low_cost, :title, :user_id, :url

  validates_presence_of :title
  validates_uniqueness_of :title, :scope => :user_id
  validates_presence_of :low_cost
  validates_presence_of :high_cost

  belongs_to :user

  def high_cost=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:high_cost] = num.to_i
  end

  def low_cost=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:low_cost] = num.to_i
  end

  def email
  end

end
