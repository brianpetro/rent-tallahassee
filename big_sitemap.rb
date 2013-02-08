require 'big_sitemap'

include Rails.application.routes.url_helpers # Allows access to Rails routes

BigSitemap.generate(:url_options => {:host => 'www.Rent-Tallahassee.com'}, :document_root => "#{APP_ROOT}/public") do
  # Add a static page
  add '/about'
  add '/'

  # Add some URLs from your Rails application
  FeedEntry.find(:all).each do |web|
    add feed_entry_path(web)
  end

end
