require "regex"

class Community < ApplicationRecord
  has_many :members
  has_many :posts
  has_many :visitors, as: :visitable

  validates :name, format: { with: REGEX::NAME }
  validates :name, length: { in: 5..20 }
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: { maximum: 255 }
  validates :description, presence: true

  before_validation do
    self.name = name.strip if name.present?
    self.description = description.strip if description.present?
  end
end
