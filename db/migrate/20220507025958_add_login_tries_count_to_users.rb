class AddLoginTriesCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :login_tries_count, :integer, null: false, default: 0
  end
end
