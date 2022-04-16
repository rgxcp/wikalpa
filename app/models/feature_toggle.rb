require "regex"

class FeatureToggle < ApplicationRecord
  enum status: { off: 0, on: 1 }

  belongs_to :user

  validate :user_role, if: -> { user.present? }
  validates :user, presence: true
  validates :name, format: { with: REGEX::FEATURE_TOGGLE_NAME }
  validates :name, length: { in: 5..50 }
  validates :name, presence: true
  validates :name, uniqueness: true

  before_validation do
    self.name = name.strip.upcase if name.present?
  end

  def self.off?(name)
    find_by(name: name.upcase).off?
  end

  def self.on?(name)
    find_by(name: name).on?
  end

  def self.off!(name)
    find_by(name: name).update(status: :off)
  end

  def self.on!(name)
    find_by(name: name).update(status: :on)
  end

  private

  def user_role
    errors.add(:user) unless user.admin?
  end
end
