require "rails_helper"

RSpec.describe Collection, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(50) }
  it { is_expected.to validate_presence_of(:name) }
end
