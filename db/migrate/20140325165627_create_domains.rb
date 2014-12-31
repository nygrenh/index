class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :domain
      t.text :description

      t.timestamps null: false
    end
  end
end
