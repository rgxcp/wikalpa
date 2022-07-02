require "rails_helper"

RSpec.describe Api::V1::User::BuddiesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/buddies").to(controller: "api/v1/user/buddies", action: :index, user_id: 1) }
  it { is_expected.to route(:post, "/api/v1/users/1/buddies").to(controller: "api/v1/user/buddies", action: :create, user_id: 1) }
end
