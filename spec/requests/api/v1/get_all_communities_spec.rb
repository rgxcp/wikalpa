require "rails_helper"

RSpec.describe "Get all communities", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when communities not exist" do
    before { get api_v1_communities_path }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when communities exist" do
    before do
      create(:community)
      get api_v1_communities_path
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["communities"]).to be_present
    end
  end
end
