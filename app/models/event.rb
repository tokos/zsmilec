class Event < ActiveRecord::Base
  attr_accessible :EVENT_DATE, :EVENT_TIME, :TEXT, :TYPE
end