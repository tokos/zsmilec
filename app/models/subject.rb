class Subject < ActiveRecord::Base
  
  set_primary_key "ID"
  
  belongs_to :day
  belongs_to :employee
  has_many :tasks
  has_and_belongs_to_many :pupils
  
  attr_accessible :NAME, :SHORT_NAME, :DESCRIPTION, :DAY_ID, :EMPLOYEE_ID, :POSITION
end