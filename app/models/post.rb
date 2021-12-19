class Post < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :community, presence: true
end