require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users").to(controller: "api/v1/users", action: :index) }
  it { is_expected.to route(:get, "/api/v1/users/1").to(controller: "api/v1/users", action: :show, id: 1) }
  it { is_expected.to route(:patch, "/api/v1/users/1").to(controller: "api/v1/users", action: :update, id: 1) }
end
