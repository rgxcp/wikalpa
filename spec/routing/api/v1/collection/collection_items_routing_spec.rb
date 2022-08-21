require "rails_helper"

RSpec.describe Api::V1::Collection::CollectionItemsController, type: :routing do
  it { is_expected.to route(:get, "/api/v1/collections/1/collection-items").to(controller: "api/v1/collection/collection_items", action: :index, collection_id: 1) }
  it { is_expected.to route(:post, "/api/v1/collections/1/collection-items").to(controller: "api/v1/collection/collection_items", action: :create, collection_id: 1) }
  it { is_expected.to route(:delete, "/api/v1/collections/1/collection-items").to(controller: "api/v1/collection/collection_items", action: :destroy_all, collection_id: 1) }
  it { is_expected.to route(:delete, "/api/v1/collections/1/collection-items/2").to(controller: "api/v1/collection/collection_items", action: :destroy, collection_id: 1, id: 2) }
end
