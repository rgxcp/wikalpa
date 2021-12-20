require 'rails_helper'

RSpec.describe Buddy, type: :model do
  subject(:buddy) { build(:buddy) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:buddy).class_name("User") }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:buddy) }
  it { is_expected.to validate_uniqueness_of(:buddy).scoped_to(:user_id) }
end
