require "rails_helper"

RSpec.describe Api::V1::BookmarksController, type: :routing do
  it { is_expected.to route(:delete, "/api/v1/bookmarks/1").to(controller: "api/v1/bookmarks", action: :destroy, id: 1) }
end
