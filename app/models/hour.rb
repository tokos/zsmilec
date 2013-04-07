class Hour < ActiveRecord::Base
  
  set_primary_key "ID"
  
  belongs_to :day
  has_many :subjects
  
  attr_accessible :DAY_ID, :HOUR, :NOTE, :POSITION, :SUBJECT_ID
end