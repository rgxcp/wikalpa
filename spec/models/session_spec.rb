require "rails_helper"

RSpec.describe Session, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:device).of_type(:string).with_options(limit: 255, null: false) }
    it { is_expected.to have_db_column(:ip).of_type(:inet).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:user_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_length_of(:device).is_at_most(255) }
    it { is_expected.to validate_presence_of(:device) }
    it { is_expected.to validate_presence_of(:ip) }
  end
end
