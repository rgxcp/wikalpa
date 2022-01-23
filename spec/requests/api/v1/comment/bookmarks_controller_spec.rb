require "rails_helper"

RSpec.describe Api::V1::Comment::BookmarksController, type: :request do
  describe "POST /comments/:comment_id/bookmarks" do
    context "when user not logged in" do
      before { post api_v1_comment_bookmarks_path(1) }

      it "returns 401 status code" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns unauthorized message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unauthorized")
      end
    end
  end
end
