class FeatureToggle < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, length: { in: 5..50 }
  validates :name, presence: true
  validates :name, uniqueness: true

  before_validation do
    self.name = name.strip.upcase if name.present?
  end
end
