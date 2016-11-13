class Group < ActiveRecord::Base
  belongs_to :business
  attr_accessible :name, :password, :personal
end
