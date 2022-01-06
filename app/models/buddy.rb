class Buddy < ApplicationRecord
  belongs_to :user
  belongs_to :buddy, class_name: "User"

  validate :adding_self_as_buddy
  validates :user, presence: true
  validates :buddy, presence: true
  validates :buddy, uniqueness: { scope: :user_id }

  private

  def adding_self_as_buddy
    errors.add(:buddy) if buddy == user
  end
end