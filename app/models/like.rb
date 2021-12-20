class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:likeable_type, :likeable_id] }
end
