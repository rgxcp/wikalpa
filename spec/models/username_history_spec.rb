require "rails_helper"

RSpec.describe UsernameHistory, type: :model do
  context "relations" do
    it { is_expected.to belong_to(:user) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:user) }
  end
end
