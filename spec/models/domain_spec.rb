require 'rails_helper'

describe Domain do
  it { is_expected.to have_many(:links) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:domain) }
end
