require "rails_helper"

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:post) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_length_of(:body).is_at_most(255) }
  it { is_expected.to validate_presence_of(:body) }

  describe "before validation" do
    context "when body contain trailing spaces" do
      it "is removed before validation" do
        comment = build(:comment, :unformatted)
        comment.validate
        expect(comment.body).to eq("just setting up my wklp")
      end
    end
  end
end
