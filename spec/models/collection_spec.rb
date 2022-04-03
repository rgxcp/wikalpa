require "rails_helper"

RSpec.describe Collection, type: :model do
  subject(:collection) { build(:collection) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:bookmarks) }
  it { is_expected.to have_many(:collection_items) }
  it { is_expected.to have_many(:upvotes) }
  it { is_expected.to have_many(:visitors) }
  it { is_expected.to accept_nested_attributes_for(:collection_items) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(50) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }
  it { is_expected.to validate_presence_of(:collection_items).on(:create) }

  describe "#before_validation" do
    context "when name contain trailing spaces" do
      it "is removed before validation" do
        collection = build(:collection, :unformatted)
        collection.validate
        expect(collection.name).to eq("Must Join Communities")
      end
    end
  end
end
