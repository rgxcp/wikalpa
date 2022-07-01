require "rails_helper"

RSpec.describe Api::V1::CommunitiesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/communities").to(controller: "api/v1/communities", action: :index) }
  it { is_expected.to route(:get, "/api/v1/communities/1").to(controller: "api/v1/communities", action: :show, id: 1) }
  it { is_expected.to route(:post, "/api/v1/communities").to(controller: "api/v1/communities", action: :create) }
  it { is_expected.to route(:patch, "/api/v1/communities/1").to(controller: "api/v1/communities", action: :update, id: 1) }
end
