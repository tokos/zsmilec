class Pupil < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  has_one :parent
  has_and_belongs_to_many :subjects
  has_many :results
  
  attr_accessible :FIRST_NAME, :LAST_NAME, :LOGIN, :ADDRESS, :EMAIL, :BIRTH_DATE, :BIRTH_NUMBER, :PARENT_CONTACT, :PASSWORD, :PARENT_ID
end