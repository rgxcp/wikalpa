require "rails_helper"

RSpec.describe CollectionItem, type: :model do
  it { is_expected.to belong_to(:collection) }
  it { is_expected.to belong_to(:collectable) }
  it { is_expected.to validate_presence_of(:collection) }
end
