require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe Expense do
    it "inherits from the Entry class" do
      expect(Expense.superclass).to eq(Entry)
    end
  end
  
end
