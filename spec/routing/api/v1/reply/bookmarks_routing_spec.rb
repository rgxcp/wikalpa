require "rails_helper"

RSpec.describe Api::V1::Reply::BookmarksController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/replies/1/bookmarks").to(controller: "api/v1/reply/bookmarks", action: :create, reply_id: 1) }
end
