class School < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  attr_accessible :NAME, :ADDRESS, :PHONE, :EMAIL, :HEADMASTER, :PHONE_MESS
end
