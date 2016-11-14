class Group < ActiveRecord::Base
  before_create :generate_token

  belongs_to :business
  has_many :user_group
  has_many :users, :through => :user_group
  attr_accessible :name, :password, :personal

  # Validation
  validates :name, presence: true

  def generate_token
    self.guid = SecureRandom.hex(4)
  end

  def to_param
    guid
  end
end
