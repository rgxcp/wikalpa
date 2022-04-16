require "rails_helper"

RSpec.describe FeatureToggle, type: :model do
  context "relations" do
    it { is_expected.to belong_to(:user) }
  end

  context "validations" do
    subject(:feature_toggle) { build(:feature_toggle) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(50) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }

    describe "#before_validation" do
      context "when name contain trailing spaces" do
        it "is removed before validation" do
          feature_toggle = build(:feature_toggle, :unformatted)
          feature_toggle.validate
          expect(feature_toggle.name).to eq("ALLOW_USERS_TO_DELETE_ACCOUNT")
        end
      end
    end
  end
end
