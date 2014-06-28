require 'rails_helper'

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
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/test.com/)
  end
end
