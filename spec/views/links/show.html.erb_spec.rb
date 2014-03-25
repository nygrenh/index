require 'spec_helper'

describe "links/show" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :title => "Title",
      :url => "Url",
      :description => "MyText",
      :source => "Source",
      :user_id => 1,
      :domain_id => "Domain"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
    rendered.should match(/Source/)
    rendered.should match(/1/)
    rendered.should match(/Domain/)
  end
end
