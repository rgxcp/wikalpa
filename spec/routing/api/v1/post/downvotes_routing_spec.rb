require "rails_helper"

RSpec.describe Api::V1::Post::DownvotesController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/posts/1/downvotes").to(controller: "api/v1/post/downvotes", action: :create, post_id: 1) }
end
