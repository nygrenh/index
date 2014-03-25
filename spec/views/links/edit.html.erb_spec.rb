require 'spec_helper'

describe "links/edit" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :title => "MyString",
      :url => "MyString",
      :description => "MyText",
      :source => "MyString",
      :user_id => 1,
      :domain_id => "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", link_path(@link), "post" do
      assert_select "input#link_title[name=?]", "link[title]"
      assert_select "input#link_url[name=?]", "link[url]"
      assert_select "textarea#link_description[name=?]", "link[description]"
      assert_select "input#link_source[name=?]", "link[source]"
      assert_select "input#link_user_id[name=?]", "link[user_id]"
      assert_select "input#link_domain_id[name=?]", "link[domain_id]"
    end
  end
end
