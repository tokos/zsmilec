class Result < ActiveRecord::Base
  
  self.primary_key = "ID"

  attr_accessible :RESULT_DATE, :NAME, :DESCRIPTION, :EVALUATION, :PUPIL_ID, :SUBJECT_ID
  
  belongs_to :pupil
  belongs_to :subject
end