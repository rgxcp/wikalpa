require "rails_helper"

RSpec.describe Api::V1::Comment::LikesController, type: :request do
  describe "GET /comments/:comment_id/likes" do
    context "when comment not exists" do
      before { get api_v1_comment_likes_path(0) }

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end

    context "when likes not exist" do
      before do
        comment = create(:comment)
        get api_v1_comment_likes_path(comment)
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end
  end
end
