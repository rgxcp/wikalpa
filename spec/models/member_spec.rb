require 'rails_helper'

RSpec.describe Member, type: :model do
  it { is_expected.to belong_to(:community) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:community) }
  it { is_expected.to validate_presence_of(:user) }
end
