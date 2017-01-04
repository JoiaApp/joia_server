class Response < ActiveRecord::Base
  belongs_to :user
  has_many :mentions
  attr_accessible :text, :user_id, :group_id, :prompt_id, :prompt, :created_at
  validates :text, presence: true
end
