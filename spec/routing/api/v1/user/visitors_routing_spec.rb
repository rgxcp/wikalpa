require "rails_helper"

RSpec.describe Api::V1::User::VisitorsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/visitors").to(controller: "api/v1/user/visitors", action: :index, user_id: 1) }
end
