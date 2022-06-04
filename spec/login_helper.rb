module LoginHelper
  def login(user_id)
    JsonWebToken.encode({ user_id: user_id })
  end
end
