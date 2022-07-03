require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:bookmarkable_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:bookmarkable_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index([:bookmarkable_type, :bookmarkable_id]) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:bookmarkable) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject(:bookmark) { build(:bookmark) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to([:bookmarkable_type, :bookmarkable_id]) }
    it { is_expected.to validate_inclusion_of(:bookmarkable_type).in_array(["Collection", "Comment", "Post", "Reply"]) }
  end
end
