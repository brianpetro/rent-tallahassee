require "spec_helper"

describe FeedEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/feed_entries").should route_to("feed_entries#index")
    end

    it "routes to #new" do
      get("/feed_entries/new").should route_to("feed_entries#new")
    end

    it "routes to #show" do
      get("/feed_entries/1").should route_to("feed_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feed_entries/1/edit").should route_to("feed_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feed_entries").should route_to("feed_entries#create")
    end

    it "routes to #update" do
      put("/feed_entries/1").should route_to("feed_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feed_entries/1").should route_to("feed_entries#destroy", :id => "1")
    end

  end
end
