class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password
  
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end

end
