class Downvote < ApplicationRecord
  belongs_to :downvoteable, polymorphic: true
end
