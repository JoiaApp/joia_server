class User < ActiveRecord::Base
  belongs_to :profile
  has_many :user_group
  has_many :groups, :through => :user_group
  attr_accessible :email, :name, :password, :role

  validates :name, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true, presence: true
end
