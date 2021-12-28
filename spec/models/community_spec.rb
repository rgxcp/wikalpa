require "rails_helper"

RSpec.describe Community, type: :model do
  subject(:community) { build(:community) }

  it { is_expected.not_to allow_value("! programmer.humor !").for(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(20) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }
  it { is_expected.to validate_presence_of(:description) }

  describe "before validation" do
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
