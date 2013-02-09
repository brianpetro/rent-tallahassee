class FeedEntrySweeper < ActionController::Caching::Sweeper
  observe FeedEntry
  
  def sweep(feed_entry)
    expire_page feed_entries_path
    expire_page feed_entry_path(site)
    expire_page "/"
    FileUtils.rm_rf "#{page_cache_directory}/feed_entries/page"
  end
  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end


