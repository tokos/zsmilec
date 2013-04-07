class Result < ActiveRecord::Base
  
  set_primary_key "ID"
  
  belongs_to :pupil
end