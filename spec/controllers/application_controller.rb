require 'rails_helper'

describe ApplicationController do
  let(:user) { FactoryGirl.create(:user) }
  describe '.current_user' do
    context 'when nobody is logged in' do
      it { expect(subject.current_user).to be(nil) }
    end

    context 'when someone is logged in' do
      before(:each) do
        session[:user_id] = user.id
      end

      it 'should return right user' do
        expect(subject.current_user).to eq(user)
      end
    end
  end
end
