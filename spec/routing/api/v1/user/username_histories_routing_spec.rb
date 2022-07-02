require "rails_helper"

RSpec.describe Api::V1::User::UsernameHistoriesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/username-histories").to(controller: "api/v1/user/username_histories", action: :index, user_id: 1) }
end
