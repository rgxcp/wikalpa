class User < ApplicationRecord
  has_secure_password

  validates :username, length: { minimum: 5 }
  validates :username, presence: true
end
