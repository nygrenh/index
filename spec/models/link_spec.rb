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

  describe '.timestamp' do
    subject(:timestamp) { link.timestamp }
    let(:time) { Time.utc(2014, 07, 9, 5) }
    let(:diff) { 0 }

    before :each do
      allow(Time).to receive(:now) { time }
      allow(link).to receive(:created_at) { time - diff }
    end

    context 'when link was created 20 seconds ago' do
      let(:diff) { 20.seconds }
      it { is_expected.to eq('just now') }
    end

    context 'when link was created 2 minutes ago' do
      let(:diff) { 2.minutes }
      it do
        expect(timestamp).to eq('2 minutes ago')
      end
    end

    context 'when link was created 1 minute ago' do
      let(:diff) { 1.minutes }
      it do
        expect(timestamp).to eq('1 minute ago')
      end
    end

    context 'when link was created 5 hours ago' do
      let(:diff) { 5.hours }
      it do
        expect(timestamp).to eq('5 hours ago')
      end
    end

    context 'when link was created yesterday' do
      let(:diff) { 1.day }
      it 'is a date without year' do
        expect(timestamp).to eq('July 8')
      end
    end

    context 'when link was over a year ago' do
      let(:diff) { 1.year + 50.days }
      it 'is a date with year' do
        expect(timestamp).to eq('May 20 2013')
      end
    end
  end
end
