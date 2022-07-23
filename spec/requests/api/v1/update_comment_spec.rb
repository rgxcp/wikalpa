require "rails_helper"

RSpec.describe "Update a comment", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { patch api_v1_comment_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when comment not exists" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_comment_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when editing someone else comment" do
    before do
      community = create(:community)
      user1 = create(:user)
      user2 = create(:user)
      post = create(:post, community: community, user: user1)
      comment = create(:comment, post: post, user: user2)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_comment_path(comment), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  context "when entity invalid" do
    before do
      community = create(:community)
      user = create(:user)
      post = create(:post, community: community, user: user)
      comment = create(:comment, post: post, user: user)
      entity = attributes_for(:comment, :invalid)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { comment: entity }
      patch api_v1_comment_path(comment), headers: headers, params: params
    end

    it "returns unprocessable entity response" do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unprocessable Entity")
      expect(parsed_body["errors"].present?).to be(true)
    end
  end

  context "when entity valid" do
    before do
      community = create(:community)
      user = create(:user)
      post = create(:post, community: community, user: user)
      comment = create(:comment, post: post, user: user)
      entity = attributes_for(:comment)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { comment: entity }
      patch api_v1_comment_path(comment), headers: headers, params: params
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["comment"]).to be_present
    end
  end

  context "when is_spoiler params set to true" do
    before do
      community = create(:community)
      user = create(:user)
      post = create(:post, community: community, user: user)
      comment = create(:comment, post: post, user: user)
      entity = attributes_for(:comment, :spoiler)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { comment: entity }
      patch api_v1_comment_path(comment), headers: headers, params: params
    end

    it "returns comment data with true is_spoiler value" do
      expect(parsed_body["data"]["comment"]["is_spoiler"]).to be(true)
    end
  end
end
