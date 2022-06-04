class AddIsExpiredToSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :is_expired, :boolean, null: false, default: false
  end
end
