require "rails_helper"

RSpec.describe Api::V1::User::RepliesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/replies").to(controller: "api/v1/user/replies", action: :index, user_id: 1) }
end
