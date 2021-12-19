class User < ApplicationRecord
  has_secure_password

  validates :username, length: { in: 5..15 }
  validates :username, presence: true
end
