class Visitor < ApplicationRecord
  belongs_to :user
  belongs_to :visitable, polymorphic: true

  validate :visiting_self_visitable, if: -> { visitable.present? && user.present? }
  validates :user, presence: true

  private

  def visiting_self_visitable
    errors.add(:visitable) if visitable.user_id == user.id
  end
end
