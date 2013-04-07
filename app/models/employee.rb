class Employee < ActiveRecord::Base
  
  set_primary_key "ID"
  
  has_many :subjects
  attr_accessible :FIRST_NAME, :LAST_NAME, :ADDRESS, :PHONE, :EMAIL, :ENTRY_DATE, :POSITION
end