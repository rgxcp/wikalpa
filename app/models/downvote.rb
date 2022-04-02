class Downvote < ApplicationRecord
  belongs_to :downvoteable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:downvoteable_type, :downvoteable_id] }
end
