require 'rails_helper'

RSpec.describe Buddy, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:buddy).class_name("User") }
  it { is_expected.to validate_presence_of(:user) }
end
