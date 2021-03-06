require "rails_helper"

RSpec.describe CommunityMember, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:community_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:community_id) }
    it { is_expected.to have_db_index(:user_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:community) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject(:community_member) { build(:community_member) }

    it { is_expected.to validate_presence_of(:community) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to(:community_id) }
  end
end
