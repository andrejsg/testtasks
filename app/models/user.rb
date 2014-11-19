class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  before_save { self.email = email.downcase }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  has_secure_password

end
