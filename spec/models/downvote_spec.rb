require "rails_helper"

RSpec.describe Downvote, type: :model do
  it { is_expected.to belong_to(:downvoteable) }
end
