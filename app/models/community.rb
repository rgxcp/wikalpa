class Community < ApplicationRecord
  validates :name, length: { minimum: 5 }
  validates :name, presence: true
end
