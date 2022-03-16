require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it { is_expected.to have_secure_password }
  it { is_expected.to have_many(:bookmarks) }
  it { is_expected.to have_many(:buddies) }
  it { is_expected.to have_many(:collections) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:members) }
  it { is_expected.to have_many(:communities).through(:members) }
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:replies) }
  it { is_expected.to have_many(:upvotes) }
  it { is_expected.to have_many(:visitors) }
  it { is_expected.not_to allow_value("! john.doe !").for(:username) }
  it { is_expected.to validate_length_of(:username).is_at_least(5).is_at_most(15) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }

  describe "custom validation" do
    context "when password equal to username" do
      it "is not valid" do
        user.password = user.username
        user.validate
        expect(user).not_to be_valid
      end
    end
  end

  describe "before validation" do
    subject(:user) { build(:user, :unformatted) }

    before { user.validate }

    context "when username contain trailing spaces" do
      it "is removed before validation" do
        expect(user.username).to eq("john.doe")
      end
    end

    context "when username not in lowercase format" do
      it "is converted into lowercase before validation" do
        expect(user.username).to eq("john.doe")
      end
    end
  end
end
