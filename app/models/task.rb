class Task < ActiveRecord::Base
  
  set_primary_key "ID"
  
  belongs_to :council
  belongs_to :subject
  
  attr_accessible :NAME, :DESCRIPTION, :DEADLINE, :STATE, :COUNCIL_ID, :SUBJECT_ID 
end