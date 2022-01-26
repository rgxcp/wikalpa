class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request, only: :destroy

  def destroy
    member = Member.find(params[:id])
    return forbidden_response unless @auth_id == member.user_id

    member.destroy

    ok_response(data: { member: member })
  end
end
