require "rails_helper"

RSpec.describe Api::V1::Community::VisitorsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/communities/1/visitors").to(controller: "api/v1/community/visitors", action: :index, community_id: 1) }
end
