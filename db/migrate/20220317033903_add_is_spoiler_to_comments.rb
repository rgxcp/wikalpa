class AddIsSpoilerToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :is_spoiler, :boolean, null: false, default: false
  end
end
