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
  has_many :visitations, class_name: "Visitor", foreign_key: "user_id"
  has_many :visitors, as: :visitable

  validate :password_equality
  validates :username, format: { with: REGEX::NAME }
  validates :username, length: { in: 5..15 }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8 }

  before_validation do
    self.username = username.strip.downcase if username.present?
  end

  after_create :log_username_history
  after_update :log_username_history, if: -> { username_previously_changed? }

  private

  def log_username_history
    UsernameHistory.create(user: self, username: username)
  end

  def password_equality
    errors.add(:password) if password == username
  end
end
