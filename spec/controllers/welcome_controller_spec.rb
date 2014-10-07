require 'rails_helper'
include LoginHelper

RSpec.describe WelcomeController, type: :controller do

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    context 'if logged in in' do
      let(:user) { FactoryGirl.create(:user) }
      let(:valid_session) { { user_id: user.id } }

      it 'should redirect to links_path' do
        get :index, {}, valid_session
        expect(response).to redirect_to(links_path)
      end
    end
  end

end
