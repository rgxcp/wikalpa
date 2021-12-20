class Buddy < ApplicationRecord
  belongs_to :user
  belongs_to :buddy, class_name: "User"
end
