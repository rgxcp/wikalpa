require "rails_helper"

RSpec.describe Session, type: :model do
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
