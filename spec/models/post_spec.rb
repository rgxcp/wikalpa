require "rails_helper"

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:community) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:bookmarks) }
  it { is_expected.to have_many(:collection_items) }
  it { is_expected.to have_many(:collections).through(:collection_items) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:upvotes) }
  it { is_expected.to have_many(:visitors) }
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
