class Log < ActiveRecord::Base
  
  #self.set_table_name "LOGS"
  self.primary_key = "ID"
  attr_accessible :LOG_TIME, :IP_ADDRESS, :CONTROLLER
  
end