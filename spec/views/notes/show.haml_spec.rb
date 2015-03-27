require 'rails_helper'

describe 'notes/show.haml' do
  let(:note) { FactoryGirl.create(:note, name: 'Some random name', text: 'The text') }
  before(:each) do
    @note = assign(:note, note)
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(note.name)
    expect(rendered).to match(note.text)
    expect(rendered).to match(//)
  end

  it 'shows timestamp' do
    render
    expect(rendered).to match(/just now/)
  end
end
