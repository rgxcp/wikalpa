require "rails_helper"

RSpec.describe FeatureToggle, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(limit: 50, null: false) }
    it { is_expected.to have_db_column(:status).of_type(:integer).with_options(default: :off, null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:name).unique }
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:status).with_values(off: 0, on: 1) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject(:feature_toggle) { build(:feature_toggle) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.not_to allow_value("ALLOW USERS TO DELETE ACCOUNT").for(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(50) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

    context "when user is not admin" do
      it "is not valid" do
        user = create(:user)
        feature_toggle = build(:feature_toggle, user: user)
        expect(feature_toggle).not_to be_valid
      end
    end

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

  describe ".off?" do
    context "when status is 0 (off)" do
      it "returns true" do
        feature_toggle = create(:feature_toggle, :off)
        expect(FeatureToggle.off?(feature_toggle.name)).to be(true)
      end
    end

    context "when status is 1 (on)" do
      it "returns false" do
        feature_toggle = create(:feature_toggle, :on)
        expect(FeatureToggle.off?(feature_toggle.name)).to be(false)
      end
    end

    it "search the name in case insensitive" do
      feature_toggle = create(:feature_toggle, :off)
      expect(FeatureToggle.off?(feature_toggle.name.downcase)).to be(true)
    end
  end

  describe ".on?" do
    context "when status is 1 (on)" do
      it "returns true" do
        feature_toggle = create(:feature_toggle, :on)
        expect(FeatureToggle.on?(feature_toggle.name)).to be(true)
      end
    end

    context "when status is 0 (off)" do
      it "returns false" do
        feature_toggle = create(:feature_toggle, :off)
        expect(FeatureToggle.on?(feature_toggle.name)).to be(false)
      end
    end

    it "search the name in case insensitive" do
      feature_toggle = create(:feature_toggle, :on)
      expect(FeatureToggle.on?(feature_toggle.name.downcase)).to be(true)
    end
  end

  describe ".off!" do
    it "updates the status to 0 (off)" do
      feature_toggle = create(:feature_toggle, :on)
      FeatureToggle.off!(feature_toggle.name)
      expect(FeatureToggle.off?(feature_toggle.name)).to be(true)
    end
  end

  describe ".on!" do
    it "updates the status to 1 (on)" do
      feature_toggle = create(:feature_toggle, :off)
      FeatureToggle.on!(feature_toggle.name)
      expect(FeatureToggle.on?(feature_toggle.name)).to be(true)
    end
  end
end
