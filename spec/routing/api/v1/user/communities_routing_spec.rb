require "rails_helper"

RSpec.describe Api::V1::User::CommunitiesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/communities").to(controller: "api/v1/user/communities", action: :index, user_id: 1) }
end
