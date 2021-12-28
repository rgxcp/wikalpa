require "rails_helper"

RSpec.describe Api::V1::MembersController, type: :request do
  describe "POST /communities/:community_id/join" do
    context "when user not logged in" do
      it "returns 401 status code" do
        post api_v1_community_join_path(1)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when community not exists" do
      it "returns 404 status code" do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_join_path(0), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when entity invalid" do
      before do
        member = create(:member)
        token = JsonWebToken.encode({ id: member.user.id })
        post api_v1_community_join_path(member.community), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns unprocessable entity message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unprocessable Entity")
      end

      it "returns validation errors" do
        result = JSON.parse(response.body)
        expect(result["errors"].size).to be_positive
      end
    end

    context "when entity valid" do
      before do
        community = create(:community)
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_join_path(community), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be true
      end

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns member data" do
        result = JSON.parse(response.body)
        expect(result["data"]["member"]).not_to be_empty
      end
    end
  end

  describe "DELETE /communities/:community_id/leave" do
    context "when user not logged in" do
      it "returns 401 status code" do
        delete api_v1_community_leave_path(1)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when community not exists" do
      it "returns 404 status code" do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        delete api_v1_community_leave_path(0), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when auth user not a community member" do
      it "returns 404 status code" do
        community = create(:community)
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        delete api_v1_community_leave_path(community), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when auth user a community member" do
      before do
        member = create(:member)
        token = JsonWebToken.encode({ id: member.user.id })
        delete api_v1_community_leave_path(member.community), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 200 status code" do
        expect(response).to have_http_status(:ok)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be true
      end

      it "returns ok message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("OK")
      end

      it "returns member data" do
        result = JSON.parse(response.body)
        expect(result["data"]["member"]).not_to be_empty
      end
    end
  end
end
