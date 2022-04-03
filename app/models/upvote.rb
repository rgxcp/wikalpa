class Upvote < ApplicationRecord
  belongs_to :upvoteable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:upvoteable_type, :upvoteable_id] }
  validates :upvoteable_type, inclusion: { in: ["Collection", "Comment", "Post", "Reply"] }

  before_create :delete_downvote_if_exists

  private

  def delete_downvote_if_exists
    downvote = Downvote.find_by(user: user, downvoteable: upvoteable)
    downvote.destroy if downvote
  end
end
