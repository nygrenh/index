require 'rails_helper'

describe User do
  subject(:user)  { FactoryGirl.build(:user) }

  it { expect(user).to be_valid }
  it { is_expected.to have_many(:links).dependent(:destroy) }
  it { is_expected.to have_many(:notes).dependent(:destroy) }
  it { is_expected.to have_many(:tags).dependent(:destroy) }
  it { is_expected.to have_many(:domains) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to have_secure_password }
end
