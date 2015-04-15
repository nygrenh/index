class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :taggables do |t|
      t.integer :tag_id
      t.references :tagged, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
