require "spec_helper"

describe DomainsController do
  describe "routing" do

    it "routes to #index" do
      get("/domains").should route_to("domains#index")
    end

    it "doesn't route to #new" do
      get("/domains/new").should_not route_to("domains#new")
    end

    it "routes to #show" do
      get("/domains/1").should route_to("domains#show", :id => "1")
    end

    it "routes to #edit" do
      get("/domains/1/edit").should route_to("domains#edit", :id => "1")
    end

    it "doesn't route to #create" do
      post("/domains").should_not route_to("domains#create")
    end

    it "routes to #update" do
      put("/domains/1").should route_to("domains#update", :id => "1")
    end

    it "doesn't route to #destroy" do
      delete("/domains/1").should_not route_to("domains#destroy", :id => "1")
    end

  end
end
