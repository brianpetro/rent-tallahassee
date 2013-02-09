class AddSiteIdToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :site_id, :integer
  end
end
