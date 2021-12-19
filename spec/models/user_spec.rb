require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:username).is_at_least(5).is_at_most(15) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }
end
