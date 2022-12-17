require "rails_helper"

RSpec.describe ExpensesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/expenses").to route_to("expenses#index")
    end

    it "routes to #show" do
      expect(get: "/expenses/1").to route_to("expenses#show", id: "1")
    end
  end
end
