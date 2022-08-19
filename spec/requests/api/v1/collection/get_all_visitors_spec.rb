require "rails_helper"

RSpec.describe "Get all visitors of a collection", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when collection not exists" do
    before { get api_v1_collection_visitors_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when visitors not exist" do
    before do
      collection = create(:collection)
      get api_v1_collection_visitors_path(collection)
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when visitors exist" do
    before do
      collection = create(:collection)
      create(:visitor, visitable: collection)
      get api_v1_collection_visitors_path(collection)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["visitors"]).to be_present
    end
  end
end
