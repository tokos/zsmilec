class Employee < ActiveRecord::Base
  
  set_primary_key "ID"
  
  has_many :subjects
  attr_accessible :FIRST_NAME, :LAST_NAME, :DEGREE, :ADDRESS, :PHONE, :EMAIL, :ENTRY_DATE, :POSITION, :TEACHER_FLAG, :image
  mount_uploader :image, ImageUploader
end