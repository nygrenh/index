class AddLinkCountToTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.integer :link_count, default: 0
    end
    reversible do |tag|
      tag.up do
        execute("update tags
        set link_count = (
          select count(*) from 'links'
          inner join 'link_tags'
          on 'links'.'id' = 'link_tags'.'link_id'
          where 'link_tags'.'tag_id' = 'tags'.'id'
        )")
      end
    end
  end
end
