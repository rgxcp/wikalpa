require "rails_helper"

RSpec.describe Api::V1::Reply::CollectionsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/replies/1/collections").to(controller: "api/v1/reply/collections", action: :index, reply_id: 1) }
end
