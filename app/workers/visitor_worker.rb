class VisitorWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(visitable_type, visitable_id, user_id)
    visitable = visitable_type.constantize.find(visitable_id)
    visitable.visitors.create(user_id: user_id)
  end
end
