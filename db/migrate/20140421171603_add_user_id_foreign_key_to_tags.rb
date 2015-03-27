class AddUserIdForeignKeyToTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.integer :user_id
    end
  end
end
