require "spec_helper"

describe LinkTagsController do
  describe "routing" do

    it "routes to #index" do
      get("/link_tags").should route_to("link_tags#index")
    end

    it "routes to #new" do
      get("/link_tags/new").should route_to("link_tags#new")
    end

    it "routes to #show" do
      get("/link_tags/1").should route_to("link_tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/link_tags/1/edit").should route_to("link_tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/link_tags").should route_to("link_tags#create")
    end

    it "routes to #update" do
      put("/link_tags/1").should route_to("link_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/link_tags/1").should route_to("link_tags#destroy", :id => "1")
    end

  end
end
