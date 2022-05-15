class ResetUserLoginTriesCountWorker
  include Sidekiq::Worker

  def perform(id)
    user = User.find(id)
    user.reset_login_tries_count!
  end
end
