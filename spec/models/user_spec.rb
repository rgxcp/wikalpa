require "rails_helper"

RSpec.describe User, type: :model do
  describe "db columns" do
    it { is_expected.to have_db_column(:username).of_type(:string).with_options(limit: 15, null: false) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string).with_options(limit: 60, null: false) }
    it { is_expected.to have_db_column(:role).of_type(:integer).with_options(default: :regular, null: false) }
    it { is_expected.to have_db_column(:login_tries_count).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { is_expected.to have_db_index(:username).unique }
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:role).with_values(regular: 0, admin: 1) }
  end

  describe "relations" do
    it { is_expected.to have_many(:bookmarks) }
    it { is_expected.to have_many(:buddies) }
    it { is_expected.to have_many(:collections) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:community_members) }
    it { is_expected.to have_many(:communities).through(:community_members) }
    it { is_expected.to have_many(:downvotes) }
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:replies) }
    it { is_expected.to have_many(:sessions) }
    it { is_expected.to have_many(:upvotes) }
    it { is_expected.to have_many(:username_histories) }
    it { is_expected.to have_many(:visitations).class_name("Visitor").with_foreign_key("user_id") }
    it { is_expected.to have_many(:visitors) }
  end

  describe "validations" do
    subject(:user) { build(:user) }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_exclusion_of(:username).in_array(User::BLACKLISTED_USERNAMES) }
    it { is_expected.not_to allow_value("! john.doe !").for(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(5).is_at_most(15) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_numericality_of(:login_tries_count).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:login_tries_count) }

    context "when password equal to username" do
      it "is not valid" do
        user.password = user.username
        expect(user).not_to be_valid
      end
    end

    context "when password empty" do
      it "does not validate length of password" do
        user.save
        refreshed_user = User.first
        refreshed_user.update(username: refreshed_user.username.reverse)
        expect(refreshed_user).to be_valid
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

  describe "callbacks" do
    subject(:user) { create(:user) }

    describe "#after_create" do
      it "logs username history" do
        username_history_exists = UsernameHistory.exists?(username: user.username)
        expect(username_history_exists).to be(true)
      end
    end

    describe "#after_update" do
      it "logs username history" do
        new_username = user.username.reverse
        user.update(username: new_username)
        new_username_history_exists = UsernameHistory.exists?(username: new_username)
        expect(new_username_history_exists).to be(true)
      end

      it "logs username history only if username previously changed" do
        new_username = user.username.reverse
        user.update(username: new_username)
        user.update(username: new_username)
        expect(UsernameHistory.count).to eq(2)
      end
    end
  end

  describe "#allow_login?" do
    context "when login tries count < 6" do
      it "returns true" do
        user = create(:user, login_tries_count: 5)
        expect(user.allow_login?).to be(true)
      end
    end

    context "when login tries count > 5" do
      it "returns false" do
        user = create(:user, login_tries_count: 6)
        expect(user.allow_login?).to be(false)
      end
    end
  end

  describe "#enqueue_reset_user_login_tries_count_job?" do
    context "when login tries count != 6" do
      it "returns false" do
        user = create(:user, login_tries_count: 5)
        expect(user.enqueue_reset_user_login_tries_count_job?).to be(false)
      end
    end

    context "when login tries count == 6" do
      it "returns true" do
        user = create(:user, login_tries_count: 6)
        expect(user.enqueue_reset_user_login_tries_count_job?).to be(true)
      end
    end
  end

  describe "#increment_login_tries_count!" do
    it "increments login tries count by 1" do
      user = create(:user, login_tries_count: 1)
      user.increment_login_tries_count!
      expect(user.login_tries_count).to eq(2)
    end
  end

  describe "#reset_login_tries_count!" do
    it "resets login tries count to 0" do
      user = create(:user, login_tries_count: 4)
      user.reset_login_tries_count!
      expect(user.login_tries_count).to eq(0)
    end
  end
end
