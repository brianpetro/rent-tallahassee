class SiteSweeper < ActionController::Caching::Sweeper
  observe Site
  
  def sweep(site)
    expire_page sites_path
    expire_page site_path(site)
    expire_page "/"
    FileUtils.rm_rf "#{page_cache_directory}/sites/page"
  end
  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end


