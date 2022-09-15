require "rails_helper"

RSpec.describe UserResourcePoliciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_resource_policies").to route_to("user_resource_policies#index")
    end

    it "routes to #show" do
      expect(get: "/user_resource_policies/1").to route_to("user_resource_policies#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_resource_policies").to route_to("user_resource_policies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_resource_policies/1").to route_to("user_resource_policies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_resource_policies/1").to route_to("user_resource_policies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_resource_policies/1").to route_to("user_resource_policies#destroy", id: "1")
    end
  end
end
