class Event < ActiveRecord::Base
  
  set_primary_key "ID"
  
  attr_accessible :EVENT_DATE, :EVENT_TIME, :TEXT, :TYPE
end