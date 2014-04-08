require 'spec_helper'

describe "note_tags/index" do
  before(:each) do
    assign(:note_tags, [
      stub_model(NoteTag),
      stub_model(NoteTag)
    ])
  end

  it "renders a list of note_tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
