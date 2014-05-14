class Log < ActiveRecord::Base
    
  self.primary_key = "ID"
  attr_accessible :LOG_TIME, :IP_ADDRESS, :CONTROLLER
  
end