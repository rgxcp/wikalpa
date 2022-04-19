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

    context "when entity invalid" do
      before do
        admin = create(:user, :admin)
        feature_toggle = attributes_for(:feature_toggle, :invalid)
        token = JsonWebToken.encode({ id: admin.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { feature_toggle: feature_toggle }
        post api_v1_admin_feature_toggles_path, headers: headers, params: params
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns unprocessable entity message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unprocessable Entity")
      end

      it "returns validation errors" do
        result = JSON.parse(response.body)
        expect(result["errors"].present?).to be(true)
      end
    end

    context "when entity valid" do
      before do
        admin = create(:user, :admin)
        feature_toggle = attributes_for(:feature_toggle)
        token = JsonWebToken.encode({ id: admin.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { feature_toggle: feature_toggle }
        post api_v1_admin_feature_toggles_path, headers: headers, params: params
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(true)
      end

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns feature toggle data" do
        result = JSON.parse(response.body)
        expect(result["data"]["feature_toggle"]).not_to be_empty
      end
    end
  end

  describe "PATCH /admin/feature-toggles/:id" do
    context "when admin not logged in" do
      before { patch api_v1_admin_feature_toggle_path(1) }

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

    context "when feature toggle not exists" do
      before do
        admin = create(:user, :admin)
        token = JsonWebToken.encode({ id: admin.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_admin_feature_toggle_path(0), headers: headers
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end
  end
end
