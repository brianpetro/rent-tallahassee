require "spec_helper"

describe ClassifiedsController do
  describe "routing" do

    it "routes to #index" do
      get("/classifieds").should route_to("classifieds#index")
    end

    it "routes to #new" do
      get("/classifieds/new").should route_to("classifieds#new")
    end

    it "routes to #show" do
      get("/classifieds/1").should route_to("classifieds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/classifieds/1/edit").should route_to("classifieds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/classifieds").should route_to("classifieds#create")
    end

    it "routes to #update" do
      put("/classifieds/1").should route_to("classifieds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/classifieds/1").should route_to("classifieds#destroy", :id => "1")
    end

  end
end
