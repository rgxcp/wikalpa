require "rails_helper"

RSpec.describe Like, type: :model do
  subject(:like) { build(:like) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:likeable) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_uniqueness_of(:user).scoped_to([:likeable_type, :likeable_id]) }
  it { is_expected.to validate_inclusion_of(:likeable_type).in_array(["Collection", "Comment", "Post", "Reply"]) }
end
