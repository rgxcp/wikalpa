require "regex"

class User < ApplicationRecord
  has_secure_password

  has_many :buddies
  has_many :comments
  has_many :members
  has_many :posts
  has_many :replies
  has_many :communities, through: :members

  validate :password_equality
  validates :username, format: { with: REGEX::NAME }
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
