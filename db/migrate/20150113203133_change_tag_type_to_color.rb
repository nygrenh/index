class ChangeTagTypeToColor < ActiveRecord::Migration
  def change
    rename_column :tags, :tag_type, :color
  end
end
