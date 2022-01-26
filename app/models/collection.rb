class Collection < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, length: { in: 5..50 }
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }

  before_validation do
    self.name = name.strip if name.present?
  end
end
