require "rails_helper"

RSpec.describe "Get all collection items inside a collection", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when collection not exists" do
    before { get api_v1_collection_collection_items_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when collection items exist" do
    before do
      collection = create(:collection)
      get api_v1_collection_collection_items_path(collection)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["collection_items"]).to be_present
    end
  end
end
