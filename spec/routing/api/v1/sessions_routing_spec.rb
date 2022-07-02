require "rails_helper"

RSpec.describe Api::V1::SessionsController, type: :routing do
  it { is_expected.to route(:delete, "/api/v1/sessions/1").to(controller: "api/v1/sessions", action: :destroy, id: 1) }
end
