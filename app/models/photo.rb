class Photo < ActiveRecord::Base
  
  self.primary_key = "ID"
  
  belongs_to :album
  
  attr_accessible :ALBUM_ID, :DESCRIPTION, :image
  mount_uploader :image, ImageUploader
  
end