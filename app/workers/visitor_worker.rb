class VisitorWorker
  include Sidekiq::Worker

  def perform(visitable_type, visitable_id, user_id)
  end
end
