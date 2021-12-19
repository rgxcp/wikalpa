class Community < ApplicationRecord
  validates :name, length: { in: 5..20 }
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
end
