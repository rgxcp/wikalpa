class Session < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :device, length: { maximum: 255 }
  validates :device, presence: true
  validates :ip, presence: true
  validates :is_expired, inclusion: { in: [true, false] }
end
