require 'rails_helper'

RSpec.describe Community, type: :model do
  subject(:community) { build(:community) }

  it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(20) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
end
