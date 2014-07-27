class ChangeLinkDomainIdToInteger < ActiveRecord::Migration
  def change
    remove_column :links, :domain_id
    change_table :links do |t|
      t.integer :domain_id
    end
  end
end
