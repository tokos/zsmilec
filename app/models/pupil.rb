class Pupil < ActiveRecord::Base
  
  set_primary_key "ID"
  
  has_one :parent
  has_and_belongs_to_many :subjects
  has_many :results
end