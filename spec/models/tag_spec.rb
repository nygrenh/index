require 'rails_helper'
require 'byebug'

describe Tag do
  subject(:tag) { FactoryGirl.create(:tag) }
  it { is_expected.to be_valid }
  it { is_expected.to have_many(:links) }
  it { is_expected.to have_many(:notes) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }

  context 'with an invalid color' do
    subject(:tag) { FactoryGirl.build(:tag, tag_type: 'invalid') }

    it { is_expected.to be_invalid }
  end

  describe 'link_count' do
    let(:link) { FactoryGirl.create(:link) }
    let(:another_link) { FactoryGirl.create(:link) }
    # We have to fetch  afresh object from database because models change data
    let(:db_tag) { Tag.find_by id: tag.id }

    before :each do
      link.tagstring = tag.name
      link.save
      another_link.tagstring = tag.name
      another_link.save
    end

    it 'should be calculated correctly' do
      expect(db_tag.link_count).to eq(2)
    end

    it 'should update when link gets destroyed' do
      link.destroy
      expect(db_tag.link_count).to eq(1)
    end
  end

  describe '#update_link_count' do
    let(:link) { FactoryGirl.create(:link) }
    it 'updates the link count' do
      tag.links << link
      expect(tag.link_count).to eq(0)
      tag.update_link_count
      expect(tag.link_count).to eq(1)
    end
  end

  describe '.get' do
    let(:user) { FactoryGirl.create(:user) }
    let(:tag) { FactoryGirl.create(:tag, user_id: user.id) }
    it 'it should find tags case insensitively' do
      expect(Tag.get(tag.name.upcase, user.id)).to eq tag
    end
  end

  it_behaves_like 'a timestamped resource'
end
