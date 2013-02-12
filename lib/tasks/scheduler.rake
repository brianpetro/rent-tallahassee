desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
  puts "Updating feed..."
  FeedEntry.rent_tallahassee
  FeedEntry.rent_philadelphia
  FeedEntry.rent_san_francisco
  puts "done with rent-tallahassee, rent-philadelphia, and rent-san-francisco."
end

desc "This task is called by the Heroku scheduler add-on"
task :update_rentals_in_fl => :environment do
  puts "Updating feeds..."
  FeedEntry.rentals_in_fl("daytona")
  FeedEntry.rentals_in_fl("fortlauderdale")
  FeedEntry.rentals_in_fl("fortmyers")
  FeedEntry.rentals_in_fl("gainesville")
  FeedEntry.rentals_in_fl("jacksonville")
  FeedEntry.rentals_in_fl("keys")
  FeedEntry.rentals_in_fl("miami")
  FeedEntry.rentals_in_fl("orlando")
  FeedEntry.rentals_in_fl("panamacity")
  FeedEntry.rentals_in_fl("sarasota")
  FeedEntry.rentals_in_fl("staugustine")
  FeedEntry.rentals_in_fl("tallahassee")
  FeedEntry.rentals_in_fl("tampa")
  FeedEntry.rentals_in_fl("westpalmbeach")
  puts "done with rentals-in-fl."
end
