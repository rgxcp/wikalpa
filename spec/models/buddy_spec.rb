require "rails_helper"

RSpec.describe Buddy, type: :model do
  context "relations" do
    it { is_expected.to belong_to(:buddy).class_name("User") }
    it { is_expected.to belong_to(:user) }
  end

  context "validations" do
    subject(:buddy) { build(:buddy) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:buddy) }
    it { is_expected.to validate_uniqueness_of(:buddy).scoped_to(:user_id) }

    context "when adding self as buddy" do
      it "is not valid" do
        user = create(:user)
        buddy = build(:buddy, user: user, buddy: user)
        expect(buddy).not_to be_valid
      end
    end
  end
end
