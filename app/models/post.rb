class Post < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :community, presence: true
  validates :user, presence: true
  validates :body, length: { maximum: 255 }
  validates :body, presence: true
end
