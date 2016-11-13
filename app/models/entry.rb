class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :mention
  belongs_to :prompt
  attr_accessible :favorite, :mention_email, :mention_text
end
