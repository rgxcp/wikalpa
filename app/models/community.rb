class Community < ApplicationRecord
  validates :name, length: { in: 5..20 }
  validates :name, presence: true
end
