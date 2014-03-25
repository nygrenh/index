class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :source
      t.integer :user_id
      t.string :domain_id

      t.timestamps
    end
  end
end
