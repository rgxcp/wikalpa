require "rails_helper"

RSpec.describe Api::V1::Reply::DownvotesController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/replies/1/downvotes").to(controller: "api/v1/reply/downvotes", action: :create, reply_id: 1) }
end
