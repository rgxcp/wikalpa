require "rails_helper"

RSpec.describe Api::V1::User::PostsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/posts").to(controller: "api/v1/user/posts", action: :index, user_id: 1) }
end
