require 'rails_helper'

describe Note do
  it { is_expected.to have_many(:tags) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:text) }
  it_behaves_like 'a timestamped resource'
end
