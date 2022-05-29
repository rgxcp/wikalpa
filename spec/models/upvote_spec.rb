require "rails_helper"

RSpec.describe Upvote, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:upvoteable) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject(:upvote) { build(:upvote) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to([:upvoteable_type, :upvoteable_id]) }
    it { is_expected.to validate_inclusion_of(:upvoteable_type).in_array(["Collection", "Comment", "Post", "Reply"]) }
  end

  describe "callbacks" do
    describe "#before_create" do
      context "when upvoteable is downvoted" do
        it "deletes the downvote first" do
          user = create(:user)
          post = create(:post, user: user)
          create(:downvote, user: user, downvoteable: post)
          create(:upvote, user: user, upvoteable: post)
          expect(Downvote.exists?(user: user, downvoteable: post)).to be(false)
        end
      end
    end
  end
end
