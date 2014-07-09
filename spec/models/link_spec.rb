require 'rails_helper'

describe Link do
  subject(:link)  { FactoryGirl.create(:link) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to have_many(:tags).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:domain).dependent(:destroy) }

  context 'with an invalid url' do
    let(:link)  { FactoryGirl.build(:link, url: 'invalid') }
    it { expect(link).not_to be_valid }
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
