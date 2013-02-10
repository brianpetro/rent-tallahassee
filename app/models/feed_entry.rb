class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url, :site_id
  belongs_to :site
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
	
	def to_param
  	"#{id}-#{name}".parameterize
  end


end
