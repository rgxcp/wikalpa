require "rails_helper"

RSpec.describe Api::V1::User::DownvotesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/downvotes").to(controller: "api/v1/user/downvotes", action: :index, user_id: 1) }
end
