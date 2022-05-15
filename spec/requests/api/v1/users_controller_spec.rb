require "rails_helper"

RSpec.describe "Api::V1::UsersController", type: :request do
  describe "GET /users" do
    context "when users not exist" do
      before { get api_v1_users_path }

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

    context "when users exist" do
      before do
        create(:user)
        get api_v1_users_path
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

      it "returns users data" do
        result = JSON.parse(response.body)
        expect(result["data"]["users"]).not_to be_empty
      end

      it "excludes password digest on users data" do
        result = JSON.parse(response.body)
        expect(result["data"]["users"][0]["password_digest"]).to be_nil
      end
    end
  end

  describe "GET /users/:id" do
    context "when user not exists" do
      before { get api_v1_user_path(0) }

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

    context "when user exists" do
      before do
        user = create(:user)
        get api_v1_user_path(user)
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

      it "returns user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]).not_to be_empty
      end

      it "excludes password digest on user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]["password_digest"]).to be_nil
      end
    end

    context "when visiting user while user logged in" do
      it "enqueues VisitorWorker job" do
        auth = create(:user)
        user = create(:user)
        token = JsonWebToken.encode({ id: auth.id })
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_path(user), headers: headers
        expect(VisitorWorker).to have_enqueued_sidekiq_job("User", user.id, auth.id)
      end
    end
  end

  describe "PATCH /users/:id" do
    context "when user not logged in" do
      before { patch api_v1_user_path(1) }

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

    context "when editing someone else account" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        token = JsonWebToken.encode({ id: user2.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_user_path(user1), headers: headers
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
        user = create(:user)
        entity = attributes_for(:user, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { user: entity }
        patch api_v1_user_path(user), headers: headers, params: params
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
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = {
          user: {
            username: "john_doe",
            password: "87654321"
          }
        }
        patch api_v1_user_path(user), headers: headers, params: params
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

      it "returns user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]).not_to be_empty
      end

      it "excludes password digest on user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]["password_digest"]).to be_nil
      end
    end
  end
end
