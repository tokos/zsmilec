class Holiday < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  attr_accessible :DATE_FROM, :DATE_TO, :NAME 
end