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
	
	def self.rentals_in_fl(city)
		feed_url = "https://dl.dropbox.com/s/s4nokapjlotpy0h/rif-daytona.xml?token_hash=AAGZxsrVcAiDColNDvA_YRD-_x5GrA8yMMtxHn3Y6cQIzQ&dl=1" if city == "daytona"
		feed_url = "https://dl.dropbox.com/s/nj5ws8t4z544zw8/rif-fortlauderdale.xml?token_hash=AAFBtawspaAETLBFNNEuAi0aTzE14baG73jkDd1u1YVjhw&dl=1" if city == "fortlauderdale"
		feed_url = "https://dl.dropbox.com/s/iqam7mvuc42kj0w/rif-fortmyers.xml?token_hash=AAF914l8czFNvhNEyul2rLT6MhC2uiAM9YTQLr9FQt3QXA&dl=1" if city == "fortmyers"
		feed_url = "https://dl.dropbox.com/s/md2zn24veecjlym/rif-gainesville.xml?token_hash=AAGcQ0rTuUjb0sGezbB0KOWnFHRa_1QFj8n0E4Y1mekAmQ&dl=1" if city == "gainesville"
		feed_url = "https://dl.dropbox.com/s/ipmb1ra4j0rjj4u/rif-jacksonville.xml?token_hash=AAH6MYKejkGGPeonHFSQ6gRxn-Y4co-ZJgC_r85xg3YJWA&dl=1" if city == "jacksonville"
		feed_url = "https://dl.dropbox.com/s/2xxge0cp8koun5o/rif-keys.xml?token_hash=AAF4_G4b1SPVPYGlyNvWcpdx9KsFZ_UC1KEiUZlxrEXJRA&dl=1" if city == "keys"
		feed_url = "https://dl.dropbox.com/s/wx840s572huwipb/rif-miami.xml?token_hash=AAFeqCI1BxIidL4F3Rqo2jxGRnhrLtsckinrcv1-2lM1GQ&dl=1" if city == "miami"
		feed_url = "https://dl.dropbox.com/s/86tra9ufqr06ndd/rif-orlando.xml?token_hash=AAEI-jZe6ZkQwi2lORbmLoLuoabjROkJlvBCDVTAEzvtWg&dl=1" if city == "orlando"
		feed_url = "https://dl.dropbox.com/s/8c1skm4o0b11a2i/rif-panamacity.xml?token_hash=AAFsjLB7sQhoiqdXXO9chZKySLWGR3wERG6iiSafRZpr7Q&dl=1" if city == "panamacity"
		feed_url = "https://dl.dropbox.com/s/stmhs1oh21e7l96/rif-sarasota.xml?token_hash=AAH07xi9yDhObvdRhnSg6vnGccHWkTpxb9Sx5P0n8ggVvg&dl=1" if city == "sarasota"
		feed_url = "https://dl.dropbox.com/s/74o14vejlci26tz/rif-staugustine.xml?token_hash=AAGOjKoCdnWLxsZtpoO1DiJAAO1Kyxw_iXJxz8wrT_ohKw&dl=1" if city == "staugustine"
		feed_url = "https://dl.dropbox.com/s/hw2pwz1cqiarl1h/rif-tallahassee.xml?token_hash=AAGduqNKtjJWw3gWy5qmLpqZ-Eg_AgvIspNZs0hX182BUQ&dl=1" if city == "tallahassee"
		feed_url = "https://dl.dropbox.com/s/o4miybno9tj4uau/rif-tampa.xml?token_hash=AAF7oeBE7tXsW6Z1iVFGXLz_gp9KbIN23MhmqFX_cJe8-w&dl=1" if city == "tampa"
		feed_url = "https://dl.dropbox.com/s/ml41brq8mwwjwl3/rif-westpalmbeach.xml?token_hash=AAG3fuc0K3785RBUjxruSxo_FBkLb_UXgyebAqKV8ODxMg&dl=1" if city == "westpalmbeach"
		site_id = 5
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

end
