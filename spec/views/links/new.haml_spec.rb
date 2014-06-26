require 'rails_helper'

describe "links/new" do
  before(:each) do
    assign(:link, stub_model(Link,
      :title => "MyString",
      :url => "MyString",
      :description => "MyText",
      :source => "MyString",
      :user_id => 1,
      :domain_id => "MyString"
    ).as_new_record)
  end

  it "renders new link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", links_path, "post" do
      assert_select "input#link_title[name=?]", "link[title]"
      assert_select "input#link_url[name=?]", "link[url]"
      assert_select "textarea#link_description[name=?]", "link[description]"
    end
  end
end
