desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
  puts "Updating feed..."
  FeedEntry.run_update_feeds
  puts "done."
end
