class Council < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  has_many :tasks
  
  attr_accessible :NAME, :START_DATE, :END_DATE, :TASKS, :RESULTS
end