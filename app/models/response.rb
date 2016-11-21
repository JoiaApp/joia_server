class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :prompt
  attr_accessible :text, :user_id, :group_id, :prompt_id
  validates :text, presence: true
end
