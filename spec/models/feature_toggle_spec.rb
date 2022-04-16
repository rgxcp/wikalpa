require "rails_helper"

RSpec.describe FeatureToggle, type: :model do
  context "enums" do
    it { is_expected.to define_enum_for(:status).with_values(off: 0, on: 1) }
  end

  context "relations" do
    it { is_expected.to belong_to(:user) }
  end

  context "validations" do
    subject(:feature_toggle) { build(:feature_toggle) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.not_to allow_value("ALLOW USERS TO DELETE ACCOUNT").for(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(50) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

    describe "#before_validation" do
      subject(:feature_toggle) { build(:feature_toggle, :unformatted) }

      before { feature_toggle.validate }

      context "when name contain trailing spaces" do
        it "is removed before validation" do
          expect(feature_toggle.name).to eq("ALLOW_USERS_TO_DELETE_ACCOUNT")
        end
      end

      context "when name not in uppercase format" do
        it "is converted into uppercase before validation" do
          expect(feature_toggle.name).to eq("ALLOW_USERS_TO_DELETE_ACCOUNT")
        end
      end
    end
  end
end
