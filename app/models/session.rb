class Session < ApplicationRecord
  enum status: { active: 0, expired: 1 }

  belongs_to :user

  validates :user, presence: true
  validates :device, length: { maximum: 255 }
  validates :device, presence: true
  validates :ip, presence: true
end
