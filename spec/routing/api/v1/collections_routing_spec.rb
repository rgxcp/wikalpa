require "rails_helper"

RSpec.describe Api::V1::CollectionsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/collections").to(controller: "api/v1/collections", action: :index) }
  it { is_expected.to route(:get, "/api/v1/collections/1").to(controller: "api/v1/collections", action: :show, id: 1) }
  it { is_expected.to route(:post, "/api/v1/collections").to(controller: "api/v1/collections", action: :create) }
  it { is_expected.to route(:patch, "/api/v1/collections/1").to(controller: "api/v1/collections", action: :update, id: 1) }
end
