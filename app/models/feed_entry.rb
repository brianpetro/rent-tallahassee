class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url, :site_id
  

	def self.update_from_feed(site_id, feed_url)
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
	
	def to_param
  	"#{id}-#{name}".parameterize
  end


end
