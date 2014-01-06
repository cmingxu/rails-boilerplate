require "spec_helper"

describe CountersController do
  describe "routing" do

    it "routes to #index" do
      get("/counters").should route_to("counters#index")
    end

    it "routes to #new" do
      get("/counters/new").should route_to("counters#new")
    end

    it "routes to #show" do
      get("/counters/1").should route_to("counters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/counters/1/edit").should route_to("counters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/counters").should route_to("counters#create")
    end

    it "routes to #update" do
      put("/counters/1").should route_to("counters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/counters/1").should route_to("counters#destroy", :id => "1")
    end

  end
end
