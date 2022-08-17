require "rails_helper"

RSpec.describe "Get all feature toggles", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when admin not logged in" do
    before { get api_v1_admin_feature_toggles_path }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when feature toggles not exist" do
    before do
      admin = create(:user, :admin)
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      get api_v1_admin_feature_toggles_path, headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when feature toggles exist" do
    before do
      admin = create(:user, :admin)
      create(:feature_toggle, user: admin)
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      get api_v1_admin_feature_toggles_path, headers: headers
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["feature_toggles"]).to be_present
    end
  end
end
