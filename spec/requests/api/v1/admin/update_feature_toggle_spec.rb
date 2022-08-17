require "rails_helper"

RSpec.describe "Update a feature toggle", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when admin not logged in" do
    before { patch api_v1_admin_feature_toggle_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when feature toggle not exists" do
    before do
      admin = create(:user, :admin)
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_admin_feature_toggle_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when entity invalid" do
    before do
      admin = create(:user, :admin)
      feature_toggle = create(:feature_toggle, user: admin)
      entity = attributes_for(:feature_toggle, :invalid)
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { feature_toggle: entity }
      patch api_v1_admin_feature_toggle_path(feature_toggle), headers: headers, params: params
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
      feature_toggle = create(:feature_toggle, user: admin, status: :off)
      entity = { status: :on }
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { feature_toggle: entity }
      patch api_v1_admin_feature_toggle_path(feature_toggle), headers: headers, params: params
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["feature_toggle"]).to be_present
    end
  end
end
