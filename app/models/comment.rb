class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies

  validates :post, presence: true
  validates :user, presence: true
  validates :body, length: { maximum: 255 }
  validates :body, presence: true

  before_validation do
    self.body = body.strip if body.present?
  end
end
