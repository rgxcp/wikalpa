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
  end
end
