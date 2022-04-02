require "rails_helper"

RSpec.describe Downvote, type: :model do
  subject(:downvote) { build(:downvote) }

  it { is_expected.to belong_to(:downvoteable) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_uniqueness_of(:user).scoped_to([:downvoteable_type, :downvoteable_id]) }
end
