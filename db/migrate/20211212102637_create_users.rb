class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 15, null: false, index: { unique: true }
      t.string :password_digest, limit: 60, null: false
      t.timestamps
    end
  end
end
