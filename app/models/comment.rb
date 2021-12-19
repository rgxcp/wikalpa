class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post, presence: true
end
