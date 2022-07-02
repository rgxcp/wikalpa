require "rails_helper"

RSpec.describe Api::V1::Reply::UpvotesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/replies/1/upvotes").to(controller: "api/v1/reply/upvotes", action: :index, reply_id: 1) }
  it { is_expected.to route(:post, "/api/v1/replies/1/upvotes").to(controller: "api/v1/reply/upvotes", action: :create, reply_id: 1) }
end
