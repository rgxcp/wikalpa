require "rails_helper"

RSpec.describe "Get all users", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when users not exist" do
    before { get api_v1_users_path }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when users exist" do
    before do
      create(:user)
      get api_v1_users_path
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["users"]).to be_present
      expect(parsed_body["data"]["users"][0]["password_digest"]).to be_nil
    end
  end
end
