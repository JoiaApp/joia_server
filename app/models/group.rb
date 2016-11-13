class Group < ActiveRecord::Base
  belongs_to :business
  has_many :user_group
  has_many :users, :through => :user_group
  attr_accessible :name, :password, :personal
end
