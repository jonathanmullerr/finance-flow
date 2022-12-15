require 'rails_helper'

RSpec.describe EntryCategory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:entry) }
    it { is_expected.to belong_to(:category) }
  end
end
