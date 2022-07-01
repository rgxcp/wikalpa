require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/posts").to(controller: "api/v1/posts", action: :index) }
  it { is_expected.to route(:get, "/api/v1/posts/1").to(controller: "api/v1/posts", action: :show, id: 1) }
  it { is_expected.to route(:patch, "/api/v1/posts/1").to(controller: "api/v1/posts", action: :update, id: 1) }
end
