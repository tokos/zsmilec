class Hour < ActiveRecord::Base
  
  set_primary_key "ID"
  
  belongs_to :day
  has_many :subjects
end