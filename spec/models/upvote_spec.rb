require "rails_helper"

RSpec.describe Upvote, type: :model do
  subject(:upvote) { build(:upvote) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:upvoteable) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_uniqueness_of(:user).scoped_to([:upvoteable_type, :upvoteable_id]) }
  it { is_expected.to validate_inclusion_of(:upvoteable_type).in_array(["Collection", "Comment", "Post", "Reply"]) }
end
