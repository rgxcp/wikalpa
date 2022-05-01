require "rails_helper"

RSpec.describe Community, type: :model do
  context "relations" do
    it { is_expected.to have_many(:collection_items) }
    it { is_expected.to have_many(:collections).through(:collection_items) }
    it { is_expected.to have_many(:community_members) }
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:visitors) }
  end

  context "validations" do
    subject(:community) { build(:community) }

    it { is_expected.not_to allow_value("! programmer.humor !").for(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(20) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:description).is_at_most(255) }
    it { is_expected.to validate_presence_of(:description) }

    describe "#before_validation" do
      subject(:community) { build(:community, :unformatted) }

      before { community.validate }

      context "when name contain trailing spaces" do
        it "is removed before validation" do
          expect(community.name).to eq("programmer.humor")
        end
      end

      context "when description contain trailing spaces" do
        it "is removed before validation" do
          expect(community.description).to eq("css is programming language")
        end
      end
    end
  end

  describe "#community_member?" do
    it "returns true if user is community member" do
      community = create(:community)
      user = create(:user)
      community_member = create(:community_member, community: community, user: user)
      expect(community.community_member?(user)).to be(true)
    end
  end
end
