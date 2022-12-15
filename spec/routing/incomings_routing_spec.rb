require "rails_helper"

RSpec.describe IncomingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/incomings").to route_to("incomings#index")
    end

    it "routes to #show" do
      expect(get: "/incomings/1").to route_to("incomings#show", id: "1")
    end
  end
end
