require "rails_helper"

RSpec.describe Buddy, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:buddy_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:buddy_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:buddy).class_name("User") }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
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
