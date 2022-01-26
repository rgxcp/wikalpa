require "rails_helper"

RSpec.describe Collection, type: :model do
  subject(:collection) { build(:collection) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(50) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }

  describe "before validation" do
    context "when name contain trailing spaces" do
      it "is removed before validation" do
        collection = build(:collection, :unformatted)
        collection.validate
        expect(collection.name).to eq("Must Join Communities")
      end
    end
  end
end
