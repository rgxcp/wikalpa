require "rails_helper"

RSpec.describe Api::V1::Collection::DownvotesController, type: :routing do
  it { is_expected.to route(:post, "/api/v1/collections/1/downvotes").to(controller: "api/v1/collection/downvotes", action: :create, collection_id: 1) }
end
