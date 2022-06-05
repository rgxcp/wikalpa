class RemoveStatusFromSessions < ActiveRecord::Migration[6.1]
  def change
    remove_column :sessions, :status
  end
end
