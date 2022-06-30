require "rails_helper"

RSpec.describe Api::V1::Collection::UpvotesController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/collections/1/upvotes").to(controller: "api/v1/collection/upvotes", action: :index, collection_id: 1) }
  it { is_expected.to route(:post, "/api/v1/collections/1/upvotes").to(controller: "api/v1/collection/upvotes", action: :create, collection_id: 1) }
end
