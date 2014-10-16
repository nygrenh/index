require 'rails_helper'

describe Link do
  subject(:link) { FactoryGirl.create(:link) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to have_many(:tags) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:domain) }

  it 'should have a domain associated' do
    expect(link.domain).not_to be_nil
  end

  context 'with an invalid url' do
    let(:link)  { FactoryGirl.build(:link, url: 'invalid') }
    it { expect(link).not_to be_valid }
  end

  context 'with a valid url' do
    let(:url)  { 'https://www.valid.com/' }
    let(:link)  { FactoryGirl.create(:link, url: url) }
    it 'should have correct url' do
      expect(link.url).to eq(url)
    end
  end

  context 'without protocol' do
    let(:url)  { 'example.com' }
    let(:link)  { FactoryGirl.create(:link, url: url) }
    let(:protocol) { 'http://' }
    it 'should get protocol added' do
      expect(link.url).to eq(protocol + url)
    end
  end

  context 'when created without title' do
    let(:link)  { FactoryGirl.create(:link, title: nil) }
    it 'title should be the url' do
      expect(link.title).to eq(link.url)
    end
  end

  context 'with a tagstring' do
    let(:link) { FactoryGirl.build(:link) }
    let(:tags) { 'tag 1, tag 2, tag 3' }
    before :each do
      link.tagstring = tags
    end
    context 'when saved' do
      before :each do
        link.save
      end
      it 'should have tags' do
        expect(link.tags.count).to eq(3)
      end
    end
  end

  it_behaves_like 'a timestamped resource'
end
