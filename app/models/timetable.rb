class Timetable < ActiveRecord::Base
  has_many :days
  
  attr_accessible :YEAR, :NAME
end