class RenameDomainDomainToName < ActiveRecord::Migration
  def change
    rename_column :domains, :domain, :name
  end
end
