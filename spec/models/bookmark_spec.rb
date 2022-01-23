require "rails_helper"

RSpec.describe Bookmark, type: :model do
  it { is_expected.to belong_to(:user) }
end
