require "rails_helper"

RSpec.describe Api::V1::CommunitiesController, type: :request do
  describe "POST /communities" do
    context "when user not logged in" do
      it "returns 401 status code" do
        post api_v1_communities_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
