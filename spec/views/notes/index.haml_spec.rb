require 'rails_helper'

describe 'notes/index.haml' do
  let(:note) { FactoryGirl.create(:note, name: 'Some random name') }
  let(:another_note) { FactoryGirl.create(:note, name: 'Test') }
  before(:each) do
    assign(:notes, [note, another_note])
    render
  end

  it 'renders a list of notes' do
    expect(rendered).to match(note.name)
  end

  it 'renders timestamps' do
    expect(rendered).to match(/just now/)
  end
end
