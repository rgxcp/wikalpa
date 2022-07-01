require "rails_helper"

RSpec.describe Api::V1::CommentsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/comments/1").to(controller: "api/v1/comments", action: :show, id: 1) }
  it { is_expected.to route(:patch, "/api/v1/comments/1").to(controller: "api/v1/comments", action: :update, id: 1) }
end
