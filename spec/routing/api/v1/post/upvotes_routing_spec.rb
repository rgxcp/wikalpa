require "rails_helper"

RSpec.describe Api::V1::Post::UpvotesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/posts/1/upvotes").to(controller: "api/v1/post/upvotes", action: :index, post_id: 1) }
  it { is_expected.to route(:post, "/api/v1/posts/1/upvotes").to(controller: "api/v1/post/upvotes", action: :create, post_id: 1) }
end
