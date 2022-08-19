require "rails_helper"

RSpec.describe "Get all upvoters of a collection", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when collection not exists" do
    before { get api_v1_collection_upvotes_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when upvotes not exist" do
    before do
      collection = create(:collection)
      get api_v1_collection_upvotes_path(collection)
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when upvotes exist" do
    before do
      user = create(:user)
      collection = create(:collection, user: user)
      create(:upvote, user: user, upvoteable: collection)
      get api_v1_collection_upvotes_path(collection)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["upvotes"]).to be_present
    end
  end
end
