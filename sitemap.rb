require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.Rent-Tallahassee.com'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'daily', :priority => 0.9
  add '/sites/sitemap.xml', changefreq: 'daily', priority: 1
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
