require "rails_helper"

RSpec.describe Api::V1::User::CollectionsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/users/1/collections").to(controller: "api/v1/user/collections", action: :index, user_id: 1) }
end
