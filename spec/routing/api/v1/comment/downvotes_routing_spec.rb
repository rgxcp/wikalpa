require "rails_helper"

RSpec.describe Api::V1::Comment::DownvotesController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/comments/1/downvotes").to(controller: "api/v1/comment/downvotes", action: :create, comment_id: 1) }
end
