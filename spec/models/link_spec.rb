require 'rails_helper'

describe Link do
  let(:link)  { FactoryGirl.build(:link) }
  it { expect(link).to be_valid }

  context 'without url' do
    let(:link)  { FactoryGirl.build(:link, url: nil) }
    it { expect(link).not_to be_valid }
  end

  context 'with an invalid url' do
    let(:link)  { FactoryGirl.build(:link, url: 'invalid') }
    it { expect(link).not_to be_valid }
  end
end
