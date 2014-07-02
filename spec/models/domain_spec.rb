require 'rails_helper'

describe Domain do
  it { is_expected.to have_many(:links) }
end
