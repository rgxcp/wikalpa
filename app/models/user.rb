class User < ApplicationRecord
  has_secure_password

  validates :username, length: { in: 5..15 }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8 }

  before_validation do
    self.username = username.strip.downcase if username.present?
  end
end
