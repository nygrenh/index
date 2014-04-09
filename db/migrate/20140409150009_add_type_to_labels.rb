class AddTypeToLabels < ActiveRecord::Migration
  def change
  	change_table :tags do |t|
  		t.string :tag_type
  	end
  end
end
