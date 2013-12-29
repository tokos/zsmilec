class Album < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  has_many :photos
  
  attr_accessible :TITLE, :DESCRIPTION, :image
  mount_uploader :image, ImageUploader
  
end