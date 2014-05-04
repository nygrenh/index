require 'spec_helper'

describe Link do
  it "isn't valid without url" do 
    link = Link.create
    expect(link).not_to be_valid
  end

  it "isn't valid with an invalid url" do 
    link = Link.create url:"invalid"
    expect(link).not_to be_valid
  end
end
