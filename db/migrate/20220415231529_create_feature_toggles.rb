class CreateFeatureToggles < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_toggles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, limit: 50, null: false, index: { unique: true }
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
