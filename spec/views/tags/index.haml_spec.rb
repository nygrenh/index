require 'rails_helper'

describe "tags/index.haml" do
  before(:each) do
    FactoryGirl.create(:tag, name: 'Name')
    FactoryGirl.create(:tag, name: 'Name')
    assign(:tags, Tag.all.page(1))
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
