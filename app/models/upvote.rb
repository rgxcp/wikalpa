class Upvote < ApplicationRecord
  belongs_to :upvoteable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:upvoteable_type, :upvoteable_id] }
  validates :upvoteable_type, inclusion: { in: ["Collection", "Comment", "Post", "Reply"] }
end
