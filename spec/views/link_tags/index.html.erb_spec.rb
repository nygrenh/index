require 'spec_helper'

describe "link_tags/index" do
  before(:each) do
    assign(:link_tags, [
      stub_model(LinkTag,
        :link_id => 1,
        :tag_id => 2
      ),
      stub_model(LinkTag,
        :link_id => 1,
        :tag_id => 2
      )
    ])
  end

  it "renders a list of link_tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
