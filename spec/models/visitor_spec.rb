require "rails_helper"

RSpec.describe Visitor, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:visitable) }
end
