require "rails_helper"

RSpec.describe Api::V1::Comment::UpvotesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/comments/1/upvotes").to(controller: "api/v1/comment/upvotes", action: :index, comment_id: 1) }
  it { is_expected.to route(:post, "/api/v1/comments/1/upvotes").to(controller: "api/v1/comment/upvotes", action: :create, comment_id: 1) }
end
