require 'rails_helper'
include LoginHelper

describe 'Domain' do
  it_behaves_like 'a private resource' do
    let(:resource_type) { :domain }
  end
end
