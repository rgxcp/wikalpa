require "rails_helper"

RSpec.describe Api::V1::Collection::BookmarksController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/collections/1/bookmarks").to(controller: "api/v1/collection/bookmarks", action: :create, collection_id: 1) }
end
