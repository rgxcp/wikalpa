require "rails_helper"

RSpec.describe Visitor, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:visitable_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:visitable_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index([:visitable_type, :visitable_id]) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:visitable) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_inclusion_of(:visitable_type).in_array(["Collection", "Community", "Post", "User"]) }
  end
end
