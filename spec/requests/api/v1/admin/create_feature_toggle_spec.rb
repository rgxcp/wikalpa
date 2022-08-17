require "rails_helper"

RSpec.describe "Create a feature toggle", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when admin not logged in" do
    before { post api_v1_admin_feature_toggles_path }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when entity invalid" do
    before do
      admin = create(:user, :admin)
      feature_toggle = attributes_for(:feature_toggle, :invalid)
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { feature_toggle: feature_toggle }
      post api_v1_admin_feature_toggles_path, headers: headers, params: params
    end

    it "returns unprocessable entity response" do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unprocessable Entity")
      expect(parsed_body["errors"].present?).to be(true)
    end
  end

  context "when entity valid" do
    before do
      admin = create(:user, :admin)
      feature_toggle = attributes_for(:feature_toggle)
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { feature_toggle: feature_toggle }
      post api_v1_admin_feature_toggles_path, headers: headers, params: params
    end

    it "returns created response" do
      expect(response).to have_http_status(:created)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("Created")
      expect(parsed_body["data"]["feature_toggle"]).to be_present
    end
  end
end
