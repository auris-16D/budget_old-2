require "rails_helper"

RSpec.describe ResourcePoliciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/resource_policies").to route_to("resource_policies#index")
    end

    it "routes to #show" do
      expect(get: "/resource_policies/1").to route_to("resource_policies#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/resource_policies").to route_to("resource_policies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/resource_policies/1").to route_to("resource_policies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/resource_policies/1").to route_to("resource_policies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/resource_policies/1").to route_to("resource_policies#destroy", id: "1")
    end
  end
end
