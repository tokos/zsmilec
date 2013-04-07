class Timetable < ActiveRecord::Base
  
  set_primary_key "ID"
  
  has_many :days
  
  attr_accessible :YEAR, :NAME
end