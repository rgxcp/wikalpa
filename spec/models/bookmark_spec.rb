require "rails_helper"

RSpec.describe Bookmark, type: :model do
  context "relations" do
    it { is_expected.to belong_to(:bookmarkable) }
    it { is_expected.to belong_to(:user) }
  end

  context "validations" do
    subject(:bookmark) { build(:bookmark) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to([:bookmarkable_type, :bookmarkable_id]) }
    it { is_expected.to validate_inclusion_of(:bookmarkable_type).in_array(["Collection", "Comment", "Post", "Reply"]) }
  end
end
