require "rails_helper"

RSpec.describe User, type: :model do
  context "enums" do
    it { is_expected.to define_enum_for(:role).with_values(regular: 0, admin: 1) }
  end

  context "relations" do
    it { is_expected.to have_many(:bookmarks) }
    it { is_expected.to have_many(:buddies) }
    it { is_expected.to have_many(:collections) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:community_members) }
    it { is_expected.to have_many(:communities).through(:community_members) }
    it { is_expected.to have_many(:downvotes) }
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:replies) }
    it { is_expected.to have_many(:upvotes) }
    it { is_expected.to have_many(:visitations).class_name("Visitor").with_foreign_key("user_id") }
    it { is_expected.to have_many(:visitors) }
  end

  context "validations" do
    subject(:user) { build(:user) }

    it { is_expected.to have_secure_password }
    it { is_expected.not_to allow_value("! john.doe !").for(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(5).is_at_most(15) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }

    context "when password equal to username" do
      it "is not valid" do
        user.password = user.username
        expect(user).not_to be_valid
      end
    end

    describe "#before_validation" do
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

  context "callbacks" do
    context "after create" do
      it "logs username history" do
        user = create(:user)
        username_history_exists = UsernameHistory.exists?(username: user.username)
        expect(username_history_exists).to be(true)
      end
    end

    context "after update" do
      it "logs username history" do
        user = create(:user)
        new_username = user.username.reverse
        user.update(username: new_username)
        new_username_history_exists = UsernameHistory.exists?(username: new_username)
        expect(new_username_history_exists).to be(true)
      end

      it "logs username history only if username previously changed" do
        user = create(:user)
        new_username = user.username.reverse
        user.update(username: new_username)
        user.update(username: new_username)
        expect(UsernameHistory.count).to eq(2)
      end
    end
  end
end
