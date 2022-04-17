require "rails_helper"

RSpec.describe "Api::V1::Admin::FeatureTogglesController", type: :request do
  describe "POST /admin/feature-toggles" do
    context "when admin not logged in" do
      before { post api_v1_admin_feature_toggles_path }

      it "returns 401 status code" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns unauthorized message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unauthorized")
      end
    end
  end
end
