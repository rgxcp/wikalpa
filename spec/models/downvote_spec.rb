require "rails_helper"

RSpec.describe Downvote, type: :model do
  subject(:downvote) { build(:downvote) }

  it { is_expected.to belong_to(:downvoteable) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_uniqueness_of(:user).scoped_to([:downvoteable_type, :downvoteable_id]) }
  it { is_expected.to validate_inclusion_of(:downvoteable_type).in_array(["Collection", "Comment", "Post", "Reply"]) }

  describe "#before_create" do
    context "when downvoteable is upvoted" do
      it "deletes the upvote first" do
        user = create(:user)
        post = create(:post, user: user)
        create(:upvote, user: user, upvoteable: post)
        create(:downvote, user: user, downvoteable: post)
        expect(Upvote.exists?(user: user, upvoteable: post)).to be(false)
      end
    end
  end
end
