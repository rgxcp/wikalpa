require "rails_helper"

RSpec.describe "Api::V1::CommunitiesController", type: :request do
  describe "GET /communities/:id" do
    context "when community not exists" do
      before { get api_v1_community_path(0) }

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

    context "when community exists" do
      before do
        community = create(:community)
        get api_v1_community_path(community)
      end

      it "returns 200 status code" do
        expect(response).to have_http_status(:ok)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(true)
      end

      it "returns ok message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("OK")
      end

      it "returns community data" do
        result = JSON.parse(response.body)
        expect(result["data"]["community"]).to be_present
      end
    end

    context "when visiting community while user logged in" do
      it "enqueues VisitorWorker job" do
        auth = create(:user)
        community = create(:community)
        token = login(auth.id)
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_community_path(community), headers: headers
        expect(VisitorWorker).to have_enqueued_sidekiq_job("Community", community.id, auth.id)
      end
    end
  end

  describe "POST /communities" do
    context "when user not logged in" do
      before { post api_v1_communities_path }

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
        user = create(:user)
        community = attributes_for(:community, :invalid)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { community: community }
        post api_v1_communities_path, headers: headers, params: params
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
        user = create(:user)
        community = attributes_for(:community)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { community: community }
        post api_v1_communities_path, headers: headers, params: params
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

      it "returns community data" do
        result = JSON.parse(response.body)
        expect(result["data"]["community"]).to be_present
      end

      it "adds auth user into community member" do
        community = Community.first
        user = User.first
        expect(community.community_member?(user)).to be(true)
      end
    end
  end

  describe "PATCH /communities/:id" do
    context "when user not logged in" do
      before { patch api_v1_community_path(1) }

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

    context "when community not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_community_path(0), headers: headers
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

    context "when user not a community member" do
      before do
        community = create(:community)
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_community_path(community), headers: headers
      end

      it "returns 403 status code" do
        expect(response).to have_http_status(:forbidden)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns forbidden message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Forbidden")
      end
    end

    context "when entity invalid" do
      before do
        community = create(:community)
        user = create(:user)
        create(:community_member, community: community, user: user)
        entity = attributes_for(:community, :invalid)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { community: entity }
        patch api_v1_community_path(community), headers: headers, params: params
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
        community = create(:community)
        user = create(:user)
        create(:community_member, community: community, user: user)
        entity = attributes_for(:community)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { community: entity }
        patch api_v1_community_path(community), headers: headers, params: params
      end

      it "returns 200 status code" do
        expect(response).to have_http_status(:ok)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(true)
      end

      it "returns ok message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("OK")
      end

      it "returns community data" do
        result = JSON.parse(response.body)
        expect(result["data"]["community"]).to be_present
      end
    end
  end
end
