class School < ActiveRecord::Base
  
  set_primary_key "ID"
  
  attr_accessible :NAME, :ADDRESS, :PHONE, :EMAIL, :HEADMASTER, :PHONE_MESS
end
