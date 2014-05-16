require 'spec_helper'

describe "links/show.haml" do
  before(:each) do
    Domain.create domain:"test.com"
    @link = assign(:link, stub_model(Link,
      :title => "Title",
      :url => "Url",
      :description => "MyText",
      :source => "Source",
      :user_id => 1,
      :domain_id => "1"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
    rendered.should match(/test.com/)
  end
end
