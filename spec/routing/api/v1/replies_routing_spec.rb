require "rails_helper"

RSpec.describe Api::V1::RepliesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/replies/1").to(controller: "api/v1/replies", action: :show, id: 1) }
  it { is_expected.to route(:patch, "/api/v1/replies/1").to(controller: "api/v1/replies", action: :update, id: 1) }
end
