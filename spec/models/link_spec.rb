require 'rails_helper'

describe Link do
  let(:link)  { FactoryGirl.build(:link) }

  it { expect(link).to be_valid }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to have_many(:tags).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:domain).dependent(:destroy) }

  context 'with an invalid url' do
    let(:link)  { FactoryGirl.build(:link, url: 'invalid') }
    it { expect(link).not_to be_valid }
  end
end
