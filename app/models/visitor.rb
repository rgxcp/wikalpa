class Visitor < ApplicationRecord
  belongs_to :user
  belongs_to :visitable, polymorphic: true

  validates :user, presence: true
end
