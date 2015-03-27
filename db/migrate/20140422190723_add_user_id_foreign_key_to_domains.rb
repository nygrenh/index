class AddUserIdForeignKeyToDomains < ActiveRecord::Migration
  def change
    change_table :domains do |t|
      t.integer :user_id
    end
  end
end
