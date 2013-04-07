class Council < ActiveRecord::Base
  has_many :tasks
  
  attr_accessible :NAME, :START_DATE, :END_DATE, :TASKS, :RESULTS
end