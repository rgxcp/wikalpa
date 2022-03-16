class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :upvoteable, polymorphic: true

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:upvoteable_type, :upvoteable_id] }
  validates :upvoteable_type, inclusion: { in: ["Collection", "Comment", "Post", "Reply"] }
end
