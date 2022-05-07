require "regex"

class User < ApplicationRecord
  enum role: { regular: 0, admin: 1 }

  has_secure_password

  has_many :bookmarks
  has_many :buddies
  has_many :collections
  has_many :comments
  has_many :community_members
  has_many :communities, through: :community_members
  has_many :downvotes
  has_many :posts
  has_many :replies
  has_many :upvotes
  has_many :username_histories
  has_many :visitations, class_name: "Visitor", foreign_key: "user_id"
  has_many :visitors, as: :visitable

  validate :password_equality
  validates :username, format: { with: REGEX::NAME }
  validates :username, length: { in: 5..15 }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :role, presence: true
  validates :login_tries_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :login_tries_count, presence: true

  before_validation do
    self.username = username.strip.downcase if username.present?
  end

  after_create :log_username_history
  after_update :log_username_history, if: -> { username_previously_changed? }

  def allow_login?
    login_tries_count <= 5
  end

  def increment_login_tries_count!
    update(login_tries_count: login_tries_count + 1)
  end

  def reset_login_tries_count!
    update(login_tries_count: 0)
  end

  private

  def log_username_history
    UsernameHistory.create(user: self, username: username)
  end

  def password_equality
    errors.add(:password) if password == username
  end
end
