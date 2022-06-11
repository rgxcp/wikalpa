FactoryBot.define do
  factory :session do
    user
    device { "Nokia 3310" }
    ip { "127.0.0.1" }
  end
end
