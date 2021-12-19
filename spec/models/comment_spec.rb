require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:post) }
  it { is_expected.to validate_presence_of(:user) }
end
