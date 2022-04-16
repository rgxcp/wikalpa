class FeatureToggle < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, length: { minimum: 5 }
  validates :name, presence: true
end
