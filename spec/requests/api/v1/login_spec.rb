require "rails_helper"

RSpec.describe "Login into an existing user", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when username not exists" do
    before do
      user = attributes_for(:user)
      post api_v1_auth_login_path, params: user
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when user maximum login tries count reached" do
    let(:user) { create(:user, login_tries_count: 5) }

    before do
      params = { username: user.username, password: user.password }
      post api_v1_auth_login_path, params: params
    end

    it "returns too many requests response" do
      expect(response).to have_http_status(:too_many_requests)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Too Many Requests")
    end

    it "enqueues ResetUserLoginTriesCountWorker job" do
      time = 30.minutes.from_now
      expect(ResetUserLoginTriesCountWorker).to have_enqueued_sidekiq_job(user.id).at(time)
    end
  end

  context "when password invalid" do
    let(:user) { create(:user) }

    before do
      params = { username: user.username, password: "!#{user.password}!" }
      post api_v1_auth_login_path, params: params
    end

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end

    it "increments user login tries count by 1" do
      user.reload
      expect(user.login_tries_count).to eq(1)
    end
  end

  context "when password valid" do
    let(:user) { create(:user, login_tries_count: 2) }

    before do
      session = attributes_for(:session)
      params = { username: user.username, password: user.password, session: session }
      post api_v1_auth_login_path, params: params
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["user"]).to be_present
      expect(parsed_body["data"]["user"]["password_digest"]).to be_nil
      expect(parsed_body["data"]["token"]).to be_present
    end

    it "resets user login tries count to 0" do
      user.reload
      expect(user.login_tries_count).to eq(0)
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
