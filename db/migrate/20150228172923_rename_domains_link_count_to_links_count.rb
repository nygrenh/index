class RenameDomainsLinkCountToLinksCount < ActiveRecord::Migration
  def change
    change_table :domains do |t|
      t.rename :link_count, :links_count
    end
  end
end
