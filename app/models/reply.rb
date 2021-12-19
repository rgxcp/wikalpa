class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :comment, presence: true
  validates :user, presence: true
end
