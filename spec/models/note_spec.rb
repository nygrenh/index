require 'rails_helper'

describe Note do
  it { is_expected.to have_many(:tags) }
  it { is_expected.to belong_to(:user) }
end
