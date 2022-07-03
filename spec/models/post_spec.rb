require "rails_helper"

RSpec.describe Post, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:community_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:body).of_type(:string).with_options(limit: 255, null: false) }
    it { is_expected.to have_db_column(:is_spoiler).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:community_id) }
    it { is_expected.to have_db_index(:user_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:community) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:bookmarks) }
    it { is_expected.to have_many(:collection_items) }
    it { is_expected.to have_many(:collections).through(:collection_items) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:downvotes) }
    it { is_expected.to have_many(:upvotes) }
    it { is_expected.to have_many(:visitors) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:community) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_length_of(:body).is_at_most(255) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.not_to allow_value(nil).for(:is_spoiler) }

    describe "#before_validation" do
      context "when body contain trailing spaces" do
        it "is removed before validation" do
          post = build(:post, :unformatted)
          post.validate
          expect(post.body).to eq("just setting up my wklp")
        end
      end
    end
  end
end
