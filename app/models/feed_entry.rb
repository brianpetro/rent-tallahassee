class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url, :site_id
  belongs_to :site
  def to_param
  	"#{id}-#{name}".parameterize
  end
  
  def self.random
  	if (c = count) != 0
  		all limit: 10, order: "published_at desc", offset: rand(c)
  	end
  end

	def self.update_from_feed(feed_url, site_id)
		feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		feed.entries.each do |entry|
		  unless exists? :guid => entry.id
		    create!(
		      :name         => entry.title,
		      :summary      => entry.summary,
		      :url          => entry.url,
		      :published_at => entry.published,
		      :guid         => entry.entry_id,
		      :site_id      => site_id
		    )
		  end
		end
	end
	
	def self.rent_tallahassee
		site_id = 1
		feed = Feedzirra::Feed.fetch_and_parse("https://dl.dropbox.com/s/xaf86vxphcy89v4/tallahassee-sub.xml?token_hash=AAHhMy84t2cwxO2TTYYrrgEqjUdzfB5bVXXI7WdRZ_IGQw&dl=1")
		feed.entries.each do |entry|
		  unless exists? :guid => entry.id
		    create!(
		      :name         => entry.title,
		      :summary      => entry.summary,
		      :url          => entry.url,
		      :published_at => entry.published,
		      :guid         => entry.entry_id,
		      :site_id      => site_id
		    )
		  end
		end
	end
	
	def self.rent_philadelphia
		site_id = 3
		feed = Feedzirra::Feed.fetch_and_parse("https://dl.dropbox.com/s/pmi9l2i037isk7j/philadelphia-sub.xml?token_hash=AAGXKuKnxY-ajrA5JxFVDJLgJWCn19sKD2PXGHIw8zOzkg&dl=1")
		feed.entries.each do |entry|
		  unless exists? :guid => entry.id
		    create!(
		      :name         => entry.title,
		      :summary      => entry.summary,
		      :url          => entry.url,
		      :published_at => entry.published,
		      :guid         => entry.entry_id,
		      :site_id      => site_id
		    )
		  end
		end
	end
	
	def self.rent_san_francisco
		site_id = 4
		feed = Feedzirra::Feed.fetch_and_parse("https://dl.dropbox.com/s/e3mbj5b2c8j2ts5/sanfrancisco-sub.xml?token_hash=AAE9cIyXG0W5aZO4gaIrZTf6NqJPAhLZJet6J-oPy0tVFg&dl=1")
		feed.entries.each do |entry|
		  unless exists? :guid => entry.id
		    create!(
		      :name         => entry.title,
		      :summary      => entry.summary,
		      :url          => entry.url,
		      :published_at => entry.published,
		      :guid         => entry.entry_id,
		      :site_id      => site_id
		    )
		  end
		end
	end
	

end
