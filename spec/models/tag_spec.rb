require 'rails_helper'

describe Tag do
  it { is_expected.to have_many(:links) }
  it { is_expected.to have_many(:notes) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }

  describe '.update_link_count' do
    let(:tag) { FactoryGirl.create(:tag) }
    let(:link) { FactoryGirl.create(:link) }
    it 'updates the link count' do
      tag.links << link
      expect(tag.link_count).to eq(0)
      tag.update_link_count
      expect(tag.link_count).to eq(1)
    end
  end
end
