require "rails_helper"

RSpec.describe Api::V1::Admin::FeatureTogglesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/admin/feature-toggles").to(controller: "api/v1/admin/feature_toggles", action: :index) }
  it { is_expected.to route(:get, "/api/v1/admin/feature-toggles/1").to(controller: "api/v1/admin/feature_toggles", action: :show, id: 1) }
  it { is_expected.to route(:post, "/api/v1/admin/feature-toggles").to(controller: "api/v1/admin/feature_toggles", action: :create) }
  it { is_expected.to route(:patch, "/api/v1/admin/feature-toggles/1").to(controller: "api/v1/admin/feature_toggles", action: :update, id: 1) }
end
