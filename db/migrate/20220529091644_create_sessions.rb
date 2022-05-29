class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :device, limit: 255, null: false
      t.inet :ip, null: false
      t.timestamps
    end
  end
end
