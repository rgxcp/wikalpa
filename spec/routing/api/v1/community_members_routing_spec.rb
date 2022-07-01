require "rails_helper"

RSpec.describe Api::V1::CommunityMembersController, type: :routing do
  it { is_expected.to route(:delete, "/api/v1/community-members/1").to(controller: "api/v1/community_members", action: :destroy, id: 1) }
end
