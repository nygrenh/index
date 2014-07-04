require 'rails_helper'

describe "tags/show.haml" do
  before(:each) do
    @tag = assign(:tag, stub_model(Tag,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
