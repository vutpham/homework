
class User < ActiveRecord::Base
  validates :user_name, :session_token, presence: true
  validates :password_digest, presence: {message: 'Password can\'t be blank'}
  validates :password, length: { minimum: 5 , allow_nil: true}

  before_validation :ensure_session_token

  attr_reader :password

  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat,
    dependent: :destroy

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return user if user && user.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end


end
