class Task < ActiveRecord::Base
  belongs_to :council
  belongs_to :subject
end