class AddColumnsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :meta_title, :string
    add_column :sites, :meta_keywords, :string
    add_column :sites, :meta_description, :string
  end
end
