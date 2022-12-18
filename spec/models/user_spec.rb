require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value("user@example.com").for(:email) }
    it { is_expected.to_not allow_value("invalid_email").for(:email) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it { is_expected.to have_many(:entries) }
    it { is_expected.to have_many(:categories) }
  end

  describe "has_secure_password" do
    it { is_expected.to respond_to(:authenticate) }
  end
end
