class Timetable < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  has_many :days
  
  attr_accessible :ID, :YEAR, :NAME
end