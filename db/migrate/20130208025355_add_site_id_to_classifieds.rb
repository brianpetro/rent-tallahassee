class AddSiteIdToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :site_id, :integer
  end
end
