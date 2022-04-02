require "rails_helper"

RSpec.describe Downvote, type: :model do
  it { is_expected.to belong_to(:downvoteable) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
end
