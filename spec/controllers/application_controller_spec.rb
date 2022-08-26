require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authenticate_request

    def index
      render json: { is_current_user: current_user?(params[:user_id].to_i) }
    end
  end

  describe "#current_user?" do
    let(:user) { create(:user) }
    let(:parsed_body) { JSON.parse(response.body) }

    before do
      token = login(user.id)
      @request.headers[:Authorization] = "Bearer #{token}"
    end

    context "when user id not equal to logged in auth id" do
      it "returns false" do
        get :index, params: { user_id: user.id + 1 }
        expect(parsed_body["is_current_user"]).to be(false)
      end
    end

    context "when user id equal to logged in auth id" do
      it "returns true" do
        get :index, params: { user_id: user.id }
        expect(parsed_body["is_current_user"]).to be(true)
      end
    end
  end
end
