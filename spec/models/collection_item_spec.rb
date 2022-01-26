require "rails_helper"

RSpec.describe CollectionItem, type: :model do
  it { is_expected.to belong_to(:collection) }
end
