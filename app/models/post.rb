class Post < ApplicationRecord
  belongs_to :community
  belongs_to :user
  has_many :comments

  validates :community, presence: true
  validates :user, presence: true
  validates :body, length: { maximum: 255 }
  validates :body, presence: true

  before_validation do
    self.body = body.strip if body.present?
  end
end
