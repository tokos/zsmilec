class Parent < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  has_many :pupils
  
  attr_accessible :FIRST_NAME, :LAST_NAME, :LOGIN, :PASSWORD, :ADDRESS, :PHONE, :EMAIL
end