desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
  puts "Updating feed..."
  FeedEntry.rent_tallahassee
  FeedEntry.rent_philadelphia
  FeedEntry.rent_san_francisco
  puts "done."
end
