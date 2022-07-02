require "rails_helper"

RSpec.describe Api::V1::User::UpvotesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/upvotes").to(controller: "api/v1/user/upvotes", action: :index, user_id: 1) }
end
