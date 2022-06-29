require "rails_helper"

RSpec.describe Api::V1::BuddiesController, type: :routing do
  it { is_expected.to route(:delete, "/api/v1/buddies/1").to(controller: "api/v1/buddies", action: :destroy, id: 1) }
end
