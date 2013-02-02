class AddColumnToSites < ActiveRecord::Migration
  def change
    add_column :sites, :call_to_subscribe, :string
    add_column :sites, :side_box_1_title, :string
    add_column :sites, :side_box_1_text, :text
    add_column :sites, :side_box_2_title, :string
    add_column :sites, :side_box_2_text, :text
  end
end
