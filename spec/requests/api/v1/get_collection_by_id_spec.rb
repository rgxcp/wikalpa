require "rails_helper"

RSpec.describe "Get a collection by id", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when collection not exists" do
    before { get api_v1_collection_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when collection exists" do
    before do
      collection = create(:collection)
      get api_v1_collection_path(collection)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["collection"]).to be_present
    end
  end

  context "when visiting collection while user logged in" do
    let(:auth) { create(:user) }
    let(:collection) { create(:collection) }

    before do
      token = login(auth.id)
      headers = { Authorization: "Bearer #{token}" }
      get api_v1_collection_path(collection), headers: headers
    end

    it "enqueues VisitorWorker job" do
      expect(VisitorWorker).to have_enqueued_sidekiq_job("Collection", collection.id, auth.id)
    end
  end
end
