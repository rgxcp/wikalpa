require "rails_helper"

RSpec.describe Api::V1::Collection::VisitorsController, type: :request do
  describe "GET /collections/:collection_id/visitors" do
    context "when collection not exists" do
      before { get api_v1_collection_visitors_path(0) }

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end
  end
end
