require 'rails_helper'

describe 'notes/new' do
  before(:each) do
    assign(:note, stub_model(Note,
                             name: 'MyString',
                             text: 'MyText',
                             user_id: ''
    ).as_new_record)
  end

  it 'renders new note form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', notes_path, 'post' do
      assert_select 'input#note_name[name=?]', 'note[name]'
      assert_select 'textarea#note_text[name=?]', 'note[text]'
    end
  end
end
