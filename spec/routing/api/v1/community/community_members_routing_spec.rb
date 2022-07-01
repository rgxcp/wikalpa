require "rails_helper"

RSpec.describe Api::V1::Community::CommunityMembersController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/communities/1/community-members").to(controller: "api/v1/community/community_members", action: :index, community_id: 1) }
  it { is_expected.to route(:post, "/api/v1/communities/1/community-members").to(controller: "api/v1/community/community_members", action: :create, community_id: 1) }
end
