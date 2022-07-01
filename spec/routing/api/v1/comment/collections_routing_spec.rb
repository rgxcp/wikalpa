require "rails_helper"

RSpec.describe Api::V1::Comment::CollectionsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/comments/1/collections").to(controller: "api/v1/comment/collections", action: :index, comment_id: 1) }
end
