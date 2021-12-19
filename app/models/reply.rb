class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :comment, presence: true
  validates :user, presence: true
  validates :body, length: { maximum: 255 }
  validates :body, presence: true

  before_validation do
    self.body = body.strip if body.present?
  end
end
