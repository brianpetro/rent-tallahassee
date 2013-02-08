class AddSiteIdToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :site_id, :integer
  end
end
