require "rails_helper"

RSpec.describe Api::V1::Post::BookmarksController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/posts/1/bookmarks").to(controller: "api/v1/post/bookmarks", action: :create, post_id: 1) }
end
