require "rails_helper"

RSpec.describe Api::V1::Collection::VisitorsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/collections/1/visitors").to(controller: "api/v1/collection/visitors", action: :index, collection_id: 1) }
end
