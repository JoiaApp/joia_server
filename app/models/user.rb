class User < ActiveRecord::Base
  belongs_to :profile
  has_many :user_group
  has_many :groups, :through => :user_group
  attr_accessible :email, :name, :password, :role, :image, :birthday, :needs_reset

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  before_save :encrypt_password

  def encrypt_password
    return unless self.password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    self.password = nil
  end
end
