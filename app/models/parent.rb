class Parent < ActiveRecord::Base
  
  set_primary_key "ID"
  
  has_many :pupils
end