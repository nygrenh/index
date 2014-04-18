require 'spec_helper'

describe "link_tags/show" do
  before(:each) do
    @link_tag = assign(:link_tag, stub_model(LinkTag,
      :link_id => 1,
      :tag_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
