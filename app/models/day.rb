class Day < ActiveRecord::Base
  
  set_primary_key "ID"
  
  belongs_to :timetable
  has_many :hours
  
  attr_accessible :NAME, :POSITION, :TIMETABLE_ID  
end