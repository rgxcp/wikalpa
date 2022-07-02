require "rails_helper"

RSpec.describe Api::V1::Post::VisitorsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/posts/1/visitors").to(controller: "api/v1/post/visitors", action: :index, post_id: 1) }
end
