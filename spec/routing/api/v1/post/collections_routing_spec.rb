require "rails_helper"

RSpec.describe Api::V1::Post::CollectionsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/posts/1/collections").to(controller: "api/v1/post/collections", action: :index, post_id: 1) }
end
