class User < ApplicationRecord
  has_secure_password

  validate :password_equality
  validates :username, format: { with: /\A[a-zA-Z0-9.\w]+\z/ }
  validates :username, length: { in: 5..15 }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8 }

  before_validation do
    self.username = username.strip.downcase if username.present?
  end

  private

  def password_equality
    errors.add(:password) if password == username
  end
end
