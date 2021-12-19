require 'rails_helper'

RSpec.describe Reply, type: :model do
  it { is_expected.to belong_to(:comment) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:comment) }
  it { is_expected.to validate_presence_of(:user) }
end
