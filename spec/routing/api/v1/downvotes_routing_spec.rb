require "rails_helper"

RSpec.describe Api::V1::DownvotesController, type: :routing do
  it { is_expected.to route(:delete, "/api/v1/downvotes/1").to(controller: "api/v1/downvotes", action: :destroy, id: 1) }
end
