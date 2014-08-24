require 'rails_helper'
include LoginHelper

describe 'Tag' do
  it_behaves_like 'a private resource' do
    let(:resource_type) { :tag }
  end
end
