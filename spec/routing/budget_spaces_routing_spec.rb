require "rails_helper"

RSpec.describe BudgetSpacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/budget_spaces").to route_to("budget_spaces#index")
    end

    it "routes to #show" do
      expect(get: "/budget_spaces/1").to route_to("budget_spaces#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/budget_spaces").to route_to("budget_spaces#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/budget_spaces/1").to route_to("budget_spaces#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/budget_spaces/1").to route_to("budget_spaces#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/budget_spaces/1").to route_to("budget_spaces#destroy", id: "1")
    end
  end
end
