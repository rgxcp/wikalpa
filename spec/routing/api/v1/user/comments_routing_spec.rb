require "rails_helper"

RSpec.describe Api::V1::User::CommentsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/comments").to(controller: "api/v1/user/comments", action: :index, user_id: 1) }
end
