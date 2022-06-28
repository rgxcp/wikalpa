require "rails_helper"

RSpec.describe Api::V1::AuthController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/auth/register").to(controller: "api/v1/auth", action: :register) }
  it { is_expected.to route(:post, "/api/v1/auth/login").to(controller: "api/v1/auth", action: :login) }
  it { is_expected.to route(:delete, "/api/v1/auth/logout").to(controller: "api/v1/auth", action: :logout) }
end
