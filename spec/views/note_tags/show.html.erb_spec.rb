require 'spec_helper'

describe "note_tags/show" do
  before(:each) do
    @note_tag = assign(:note_tag, stub_model(NoteTag))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
