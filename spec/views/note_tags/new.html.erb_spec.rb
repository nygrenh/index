require 'spec_helper'

describe "note_tags/new" do
  before(:each) do
    assign(:note_tag, stub_model(NoteTag).as_new_record)
  end

  it "renders new note_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", note_tags_path, "post" do
    end
  end
end
