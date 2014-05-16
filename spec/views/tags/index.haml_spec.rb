require 'spec_helper'

describe "tags/index.haml" do
  before(:each) do
    assign(:tags, [
      stub_model(Tag,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Tag,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
