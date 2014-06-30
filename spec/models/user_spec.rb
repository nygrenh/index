require 'rails_helper'

describe User do
  let(:user)  { FactoryGirl.build(:user) }
  it { expect(user).to be_valid }

  context 'without name' do
    let(:user)  { FactoryGirl.build(:user, name: nil) }
    it { expect(user).not_to be_valid }
  end

  context 'without unique name' do
    let(:user2)  { FactoryGirl.create(:user) }
    it 'should not be valid' do
      expect(user2).to be_valid
      expect(user).not_to be_valid
    end
  end

  context 'without password' do
    let(:user)  { FactoryGirl.build(:user, password: nil) }
    it { expect(user).not_to be_valid }
  end

end
