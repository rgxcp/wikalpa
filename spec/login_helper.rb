module LoginHelper
  def login(user_id)
    session_id = create(:session, user_id: user_id).id
    JsonWebToken.encode({ user_id: user_id, session_id: session_id })
  end
end
