require 'rails_helper'

RSpec.describe Incoming, type: :model do
  describe Incoming do
    it "inherits from the Entry class" do
      expect(Incoming.superclass).to eq(Entry)
    end
  end
end
