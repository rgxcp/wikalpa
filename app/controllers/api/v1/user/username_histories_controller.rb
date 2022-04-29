class Api::V1::User::UsernameHistoriesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    username_histories = user.username_histories

    ok_response(data: { username_histories: username_histories })
  end
end
