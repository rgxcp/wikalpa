class Session < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :device, presence: true
end
