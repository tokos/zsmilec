class Event < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  attr_accessible :EVENT_DATE, :EVENT_TIME, :TEXT, :TYPE, :DESCRIPTION 
end