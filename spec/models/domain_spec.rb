require 'rails_helper'

describe Domain do
  it { is_expected.to have_many(:links) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }

  context 'with links' do
    let(:link) { FactoryGirl.create(:link) }
    let(:another_link) { FactoryGirl.create(:link) }
    let(:domain) { FactoryGirl.create(:domain) }

    before :each do
      domain.links << link
      domain.links << another_link
    end

    context 'when some links get destroyed' do
      before :each do
        link.destroy
      end

      it "domain doesn't get destroyed" do
        expect(domain).not_to be_destroyed
      end
    end

    context 'when all links get destroyed' do
      before :each do
        link.destroy
        another_link.destroy
      end

      it 'domain gets destroyed' do
        expect(domain).to be_destroyed
      end
    end
  end

  it_behaves_like 'a timestamped resource'
end
