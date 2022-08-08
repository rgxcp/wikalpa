require "rails_helper"

RSpec.describe "Get all posts", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when posts not exist" do
    before { get api_v1_posts_path }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when posts exist" do
    before do
      create(:post)
      get api_v1_posts_path
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["posts"]).to be_present
    end
  end
end
