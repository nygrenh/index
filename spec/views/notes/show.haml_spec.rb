require 'rails_helper'

describe "notes/show" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :name => "Name",
      :text => "MyText",
      :user_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
