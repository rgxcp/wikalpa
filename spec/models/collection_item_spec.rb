require "rails_helper"

RSpec.describe CollectionItem, type: :model do
  context "relations" do
    it { is_expected.to belong_to(:collectable) }
    it { is_expected.to belong_to(:collection) }
  end

  context "validations" do
    subject(:collection_item) { build(:collection_item) }

    it { is_expected.to validate_presence_of(:collection) }
    it { is_expected.to validate_inclusion_of(:collectable_type).in_array(["Comment", "Community", "Post", "Reply", "User"]) }
    it { is_expected.to validate_uniqueness_of(:collectable_id).scoped_to(:collection_id) }
  end
end
