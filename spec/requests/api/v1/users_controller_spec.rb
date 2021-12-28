require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "PATCH /users/:id" do
    context "when user not logged in" do
      it "returns 401 status code" do
        patch api_v1_user_path(1)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
