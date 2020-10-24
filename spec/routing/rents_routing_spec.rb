require "rails_helper"

RSpec.describe RentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rents").to route_to("rents#index")
    end

    it "routes to #show" do
      expect(get: "/rents/1").to route_to("rents#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/rents").to route_to("rents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rents/1").to route_to("rents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rents/1").to route_to("rents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rents/1").to route_to("rents#destroy", id: "1")
    end
  end
end
