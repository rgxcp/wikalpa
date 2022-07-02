require "rails_helper"

RSpec.describe Api::V1::UpvotesController, type: :routing do
  it { is_expected.to route(:delete, "/api/v1/upvotes/1").to(controller: "api/v1/upvotes", action: :destroy, id: 1) }
end
