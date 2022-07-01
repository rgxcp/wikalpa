require "rails_helper"

RSpec.describe Api::V1::Community::PostsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/communities/1/posts").to(controller: "api/v1/community/posts", action: :index, community_id: 1) }
  it { is_expected.to route(:post, "/api/v1/communities/1/posts").to(controller: "api/v1/community/posts", action: :create, community_id: 1) }
end
