require "rails_helper"

RSpec.describe Api::V1::Community::CollectionsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/communities/1/collections").to(controller: "api/v1/community/collections", action: :index, community_id: 1) }
end
