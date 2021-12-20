class Like < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:likeable_type, :likeable_id] }
end
