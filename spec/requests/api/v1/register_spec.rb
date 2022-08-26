require "rails_helper"

RSpec.describe "Register a new user", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when entity invalid" do
    before do
      user = attributes_for(:user, :invalid)
      params = { user: user }
      post api_v1_auth_register_path, params: params
    end

    it "returns unprocessable entity response" do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unprocessable Entity")
      expect(parsed_body["errors"].present?).to be(true)
    end
  end

  User::BLACKLISTED_USERNAMES.each do |blacklisted_username|
    context "when using '#{blacklisted_username}' as username (blacklisted username)" do
      before do
        user = attributes_for(:user, username: blacklisted_username)
        params = { user: user }
        post api_v1_auth_register_path, params: params
      end

      it "returns unprocessable entity response" do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_body["success"]).to be(false)
        expect(parsed_body["message"]).to eq("Unprocessable Entity")
        expect(parsed_body["errors"].present?).to be(true)
      end
    end
  end

  context "when entity valid" do
    before do
      user = attributes_for(:user)
      session = attributes_for(:session)
      params = { user: user, session: session }
      post api_v1_auth_register_path, params: params
    end

    it "returns created response" do
      expect(response).to have_http_status(:created)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("Created")
      expect(parsed_body["data"]["user"]).to be_present
      expect(parsed_body["data"]["user"]["password_digest"]).to be_nil
      expect(parsed_body["data"]["token"]).to be_present
    end

    it "stores user session" do
      user_id = parsed_body["data"]["user"]["id"]
      expect(Session.exists?(user_id: user_id)).to be(true)
    end

    it "stores user session_id in given token" do
      token = parsed_body["data"]["token"]
      expect(JsonWebToken.decode(token).first["session_id"]).to be_present
    end
  end
end
