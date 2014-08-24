require 'rails_helper'
include LoginHelper

describe 'Note' do
  it_behaves_like 'a private resource' do
    let(:resource_type) { :note }
  end
end
