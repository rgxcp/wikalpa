require "rails_helper"

RSpec.describe CommunityMember, type: :model do
  subject(:community_member) { build(:community_member) }

  it { is_expected.to belong_to(:community) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:community) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_uniqueness_of(:user).scoped_to(:community_id) }
end
