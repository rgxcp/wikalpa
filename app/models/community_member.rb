class CommunityMember < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :community, presence: true
  validates :user, presence: true
  validates :user, uniqueness: { scope: :community_id }
end
