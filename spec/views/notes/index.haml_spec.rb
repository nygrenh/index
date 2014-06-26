require 'rails_helper'

describe "notes/index.haml" do
  before(:each) do
    assign(:notes, [
      stub_model(Note,
        :name => "Name",
        :text => "MyText",
      ),
      stub_model(Note,
        :name => "Name",
        :text => "MyText",
      )
    ])
  end

  it "renders a list of notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "div>div", :text => "Name".to_s, :count => 2
    assert_select "div>div", :text => "MyText".to_s, :count => 2
  end
end
