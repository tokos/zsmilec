class Task < ActiveRecord::Base
  
  set_primary_key "ID"
  
  belongs_to :council
  belongs_to :subject
end