require "rails_helper"

RSpec.describe Api::V1::User::SessionsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/sessions").to(controller: "api/v1/user/sessions", action: :index, user_id: 1) }
end
