require "rails_helper"

RSpec.describe Visitor, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:visitable) }
  it { is_expected.to validate_presence_of(:user) }

  describe "custom validation" do
    context "when visiting self visitable" do
      it "is not valid" do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        visitor = build(:visitor, user: user, visitable: post)
        visitor.validate
        expect(visitor).not_to be_valid
      end
    end
  end
end
