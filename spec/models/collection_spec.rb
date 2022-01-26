require "rails_helper"

RSpec.describe Collection, type: :model do
  it { is_expected.to belong_to(:user) }
end
