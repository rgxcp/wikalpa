class CreateUsernameHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :username_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username, null: false
      t.timestamps
    end
  end
end
