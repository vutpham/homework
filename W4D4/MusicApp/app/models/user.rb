require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  after_initialize :ensure_session_token


  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    session_token = User.generate_session_token
    self.update(session_token: session_token)
    session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user.nil?
      flash[:errors] = "Invalid Email or Password"
    elsif user.is_password?(password)
      return user
    end
  end

end
