class Visitor < ApplicationRecord
  belongs_to :user
  belongs_to :visitable, polymorphic: true
end
