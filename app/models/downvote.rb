class Downvote < ApplicationRecord
  belongs_to :downvoteable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:downvoteable_type, :downvoteable_id] }
  validates :downvoteable_type, inclusion: { in: ["Collection", "Comment", "Post", "Reply"] }

  before_create :delete_upvote_if_exists

  private

  def delete_upvote_if_exists
    upvote = Upvote.find_by(user: user, upvoteable: downvoteable)
    upvote.destroy if upvote
  end
end
