require 'spec_helper'

describe "note_tags/edit" do
  before(:each) do
    @note_tag = assign(:note_tag, stub_model(NoteTag))
  end

  it "renders the edit note_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", note_tag_path(@note_tag), "post" do
    end
  end
end
