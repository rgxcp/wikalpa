require "rails_helper"

RSpec.describe CollectionItem, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:collection_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:collectable_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:collectable_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index([:collectable_type, :collectable_id]) }
    it { is_expected.to have_db_index(:collection_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:collectable) }
    it { is_expected.to belong_to(:collection) }
  end

  describe "validations" do
    subject(:collection_item) { build(:collection_item) }

    it { is_expected.to validate_presence_of(:collection) }
    it { is_expected.to validate_inclusion_of(:collectable_type).in_array(["Comment", "Community", "Post", "Reply", "User"]) }
    it { is_expected.to validate_uniqueness_of(:collectable_id).scoped_to(:collection_id) }
  end
end
