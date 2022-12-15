require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:entry_categories) }
    it { is_expected.to have_many(:entries).through(:entry_categories) }
  end
end
