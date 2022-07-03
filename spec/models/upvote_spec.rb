require "rails_helper"

RSpec.describe Upvote, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:upvoteable_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:upvoteable_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index([:upvoteable_type, :upvoteable_id]) }
    it { is_expected.to have_db_index(:user_id) }
  end

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
