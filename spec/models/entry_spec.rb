require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:entry_categories) }
    it { is_expected.to have_many(:categories).through(:entry_categories) }
  end
end
