class ChangeSessions < ActiveRecord::Migration[6.1]
  def change
    change_table :sessions do |t|
      t.remove :is_expired
      t.integer :status, null: false, default: 0
    end
  end
end
