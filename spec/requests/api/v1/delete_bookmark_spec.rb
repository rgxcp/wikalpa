require "rails_helper"

RSpec.describe "Delete a bookmark", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { delete api_v1_bookmark_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when bookmark not exists" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_bookmark_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when deleting someone else bookmark" do
    before do
      community = create(:community)
      user1 = create(:user)
      user2 = create(:user)
      post = create(:post, community: community, user: user1)
      bookmark = create(:bookmark, user: user2, bookmarkable: post)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_bookmark_path(bookmark), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  context "when bookmark exists" do
    before do
      community = create(:community)
      user = create(:user)
      post = create(:post, community: community, user: user)
      bookmark = create(:bookmark, user: user, bookmarkable: post)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_bookmark_path(bookmark), headers: headers
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["bookmark"]).to be_present
    end
  end
end
