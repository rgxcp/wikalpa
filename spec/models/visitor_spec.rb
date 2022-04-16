require "rails_helper"

RSpec.describe Visitor, type: :model do
  context "relations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:visitable) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_inclusion_of(:visitable_type).in_array(["Collection", "Community", "Post", "User"]) }
  end
end
