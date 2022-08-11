require "rails_helper"

RSpec.describe "Update a reply", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { patch api_v1_reply_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when reply not exists" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_reply_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when editing someone else reply" do
    before do
      community = create(:community)
      user1 = create(:user)
      user2 = create(:user)
      post = create(:post, community: community, user: user1)
      comment = create(:comment, post: post, user: user1)
      reply = create(:reply, comment: comment, user: user2)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_reply_path(reply), headers: headers
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
      reply = create(:reply, comment: comment, user: user)
      entity = attributes_for(:reply, :invalid)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { reply: entity }
      patch api_v1_reply_path(reply), headers: headers, params: params
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
      reply = create(:reply, comment: comment, user: user)
      entity = attributes_for(:reply)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { reply: entity }
      patch api_v1_reply_path(reply), headers: headers, params: params
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["reply"]).to be_present
    end
  end

  context "when is_spoiler params set to true" do
    before do
      community = create(:community)
      user = create(:user)
      post = create(:post, community: community, user: user)
      comment = create(:comment, post: post, user: user)
      reply = create(:reply, comment: comment, user: user)
      entity = attributes_for(:reply, :spoiler)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { reply: entity }
      patch api_v1_reply_path(reply), headers: headers, params: params
    end

    it "returns reply data with true is_spoiler value" do
      expect(parsed_body["data"]["reply"]["is_spoiler"]).to be(true)
    end
  end
end
