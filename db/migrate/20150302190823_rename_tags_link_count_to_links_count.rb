class RenameTagsLinkCountToLinksCount < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.rename :link_count, :links_count
    end
  end
end
