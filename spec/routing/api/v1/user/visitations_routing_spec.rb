require "rails_helper"

RSpec.describe Api::V1::User::VisitationsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/visitations").to(controller: "api/v1/user/visitations", action: :index, user_id: 1) }
end
