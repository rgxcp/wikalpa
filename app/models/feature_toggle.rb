class FeatureToggle < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, length: { in: 5..50 }
  validates :name, presence: true
end
