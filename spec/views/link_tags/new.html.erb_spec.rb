require 'spec_helper'

describe "link_tags/new" do
  before(:each) do
    assign(:link_tag, stub_model(LinkTag,
      :link_id => 1,
      :tag_id => 1
    ).as_new_record)
  end

  it "renders new link_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", link_tags_path, "post" do
      assert_select "input#link_tag_link_id[name=?]", "link_tag[link_id]"
      assert_select "input#link_tag_tag_id[name=?]", "link_tag[tag_id]"
    end
  end
end
