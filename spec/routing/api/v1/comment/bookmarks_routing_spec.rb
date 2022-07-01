require "rails_helper"

RSpec.describe Api::V1::Comment::BookmarksController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/comments/1/bookmarks").to(controller: "api/v1/comment/bookmarks", action: :create, comment_id: 1) }
end
