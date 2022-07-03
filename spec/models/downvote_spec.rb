require "rails_helper"

RSpec.describe Downvote, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:downvoteable_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:downvoteable_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index([:downvoteable_type, :downvoteable_id]) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:downvoteable) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject(:downvote) { build(:downvote) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to([:downvoteable_type, :downvoteable_id]) }
    it { is_expected.to validate_inclusion_of(:downvoteable_type).in_array(["Collection", "Comment", "Post", "Reply"]) }
  end

  describe "callbacks" do
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
end
