require "rails_helper"

RSpec.describe BudgetUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/budget_users").to route_to("budget_users#index")
    end

    it "routes to #show" do
      expect(get: "/budget_users/1").to route_to("budget_users#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/budget_users").to route_to("budget_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/budget_users/1").to route_to("budget_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/budget_users/1").to route_to("budget_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/budget_users/1").to route_to("budget_users#destroy", id: "1")
    end
  end
end
