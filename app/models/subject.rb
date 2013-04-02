class Subject < ActiveRecord::Base
  belongs_to :day
  belongs_to :employee
  has_many :tasks
  has_and_belongs_to_many :pupils
end