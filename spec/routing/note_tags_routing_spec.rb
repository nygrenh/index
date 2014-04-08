require "spec_helper"

describe NoteTagsController do
  describe "routing" do

    it "routes to #index" do
      get("/note_tags").should route_to("note_tags#index")
    end

    it "routes to #new" do
      get("/note_tags/new").should route_to("note_tags#new")
    end

    it "routes to #show" do
      get("/note_tags/1").should route_to("note_tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/note_tags/1/edit").should route_to("note_tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/note_tags").should route_to("note_tags#create")
    end

    it "routes to #update" do
      put("/note_tags/1").should route_to("note_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/note_tags/1").should route_to("note_tags#destroy", :id => "1")
    end

  end
end
