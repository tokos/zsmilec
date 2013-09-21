class Monthly
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end
  
  attr_accessor :monthly
end