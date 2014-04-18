class CreateLinkTags < ActiveRecord::Migration
  def change
    create_table :link_tags do |t|
      t.integer :link_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
