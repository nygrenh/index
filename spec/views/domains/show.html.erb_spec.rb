require 'spec_helper'

describe "domains/show" do
  before(:each) do
    @domain = assign(:domain, stub_model(Domain,
      :domain => "Domain",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Domain/)
    rendered.should match(/MyText/)
  end
end
