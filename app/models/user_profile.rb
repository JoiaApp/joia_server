class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :image, :reminder_time
end
