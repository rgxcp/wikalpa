require "rails_helper"

RSpec.describe "Revoke downvote an entity", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { delete api_v1_downvote_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when downvote not exists" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_downvote_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when deleting someone else downvote" do
    before do
      community = create(:community)
      user1 = create(:user)
      user2 = create(:user)
      post = create(:post, community: community, user: user1)
      downvote = create(:downvote, user: user2, downvoteable: post)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_downvote_path(downvote), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  context "when downvote exists" do
    before do
      community = create(:community)
      user = create(:user)
      post = create(:post, community: community, user: user)
      downvote = create(:downvote, user: user, downvoteable: post)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_downvote_path(downvote), headers: headers
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["downvote"]).to be_present
    end
  end
end
