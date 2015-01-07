require 'rails_helper'

describe 'tags/edit' do
  before(:each) do
    @tag = assign(:tag, FactoryGirl.create(:tag))
    @colors = Color.colors
  end

  it 'renders the edit tag form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', tag_path(@tag), 'post' do
      assert_select 'input#tag_name[name=?]', 'tag[name]'
      assert_select 'textarea#tag_description[name=?]', 'tag[description]'
    end
  end
end
