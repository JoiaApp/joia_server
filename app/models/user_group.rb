class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  attr_accessible :user_id, :group_id

  validates :user_id, presence: true
  validates :group_id, presence: true
end
