class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.text :text
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
