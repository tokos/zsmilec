class Subject < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  belongs_to :day
  belongs_to :employee
  has_many :tasks
  has_many :results
  has_and_belongs_to_many :pupils
  
  attr_accessible :NAME, :SHORT_NAME, :DESCRIPTION, :HOUR_ID, :EMPLOYEE_ID, :POSITION
end