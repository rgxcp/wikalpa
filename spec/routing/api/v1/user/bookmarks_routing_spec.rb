require "rails_helper"

RSpec.describe Api::V1::User::BookmarksController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/bookmarks").to(controller: "api/v1/user/bookmarks", action: :index, user_id: 1) }
end
