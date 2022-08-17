require "rails_helper"

RSpec.describe "Get a feature toggle by id", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when admin not logged in" do
    before { get api_v1_admin_feature_toggle_path(1) }

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
      get api_v1_admin_feature_toggle_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when feature toggle exists" do
    before do
      admin = create(:user, :admin)
      feature_toggle = create(:feature_toggle, user: admin)
      token = login(admin.id)
      headers = { Authorization: "Bearer #{token}" }
      get api_v1_admin_feature_toggle_path(feature_toggle), headers: headers
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["feature_toggle"]).to be_present
    end
  end
end
