class AddLinkCountToDomains < ActiveRecord::Migration
  def change
    change_table :domains do |t|
      t.integer :link_count, default: 0
    end
    reversible do |domain|
      domain.up { execute("update domains set link_count = (select count(*) from 'links'  where 'links'.'domain_id' = 'domains'.'id')") }
    end
  end
end
