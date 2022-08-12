require "rails_helper"

RSpec.describe "Get a user by id", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not exists" do
    before { get api_v1_user_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when user exists" do
    before do
      user = create(:user)
      get api_v1_user_path(user)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["user"]).to be_present
      expect(parsed_body["data"]["user"]["password_digest"]).to be_nil
    end
  end

  context "when visiting user while user logged in" do
    let(:auth) { create(:user) }
    let(:user) { create(:user) }

    before do
      token = login(auth.id)
      headers = { Authorization: "Bearer #{token}" }
      get api_v1_user_path(user), headers: headers
    end

    it "enqueues VisitorWorker job" do
      expect(VisitorWorker).to have_enqueued_sidekiq_job("User", user.id, auth.id)
    end
  end
end
