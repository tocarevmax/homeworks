class User < ApplicationRecord

  attr_reader :password

  before_validation :ensure_session_token

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {message: 'Password can\t be blank.'}
  validates :password, length: { minimum: 6, allow_nil: :true}

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def self.find_by_credentials(user, pass)
    user = User.find_by(username: user)
    if user &&
        BCrypt::Password.new(user.password_digest).is_password?(pass)
      user
    else
      nil
    end
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
