require "rails_helper"

RSpec.describe CollectionItem, type: :model do
  subject(:collection_item) { build(:collection_item) }

  it { is_expected.to belong_to(:collection) }
  it { is_expected.to belong_to(:collectable) }
  it { is_expected.to validate_presence_of(:collection) }
  it { is_expected.to validate_uniqueness_of(:collectable_id).scoped_to(:collection_id) }
end
