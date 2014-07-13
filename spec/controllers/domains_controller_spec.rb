require 'rails_helper'

describe DomainsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }
  let(:valid_attributes) { FactoryGirl.attributes_for(:domain) }
  let!(:domain) { FactoryGirl.create(:domain, user_id: user.id) }

  describe 'GET index' do
    it 'assigns all domains as @domains' do
      get :index, {}, valid_session
      expect(assigns(:domains)).to eq([domain])
    end
  end

  describe 'GET show' do
    it 'assigns the requested domain as @domain' do
      get :show, { id: domain.to_param }, valid_session
      expect(assigns(:domain)).to eq(domain)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested domain as @domain' do
      get :edit, { id: domain.to_param }, valid_session
      expect(assigns(:domain)).to eq(domain)
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested domain' do
        expect_any_instance_of(Domain).to receive(:update).with('description' => 'MyString')
        put :update, { id: domain.to_param, domain: { 'description' => 'MyString' } }, valid_session
      end

      it 'assigns the requested domain as @domain' do
        put :update, { id: domain.to_param, domain: valid_attributes }, valid_session
        expect(assigns(:domain)).to eq(domain)
      end

      it 'redirects to the domain' do
        put :update, { id: domain.to_param, domain: valid_attributes }, valid_session
        expect(response).to redirect_to(domain)
      end
    end

    describe 'with invalid params' do
      it 'assigns the domain as @domain' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Domain).to receive(:save).and_return(false)
        put :update, { id: domain.to_param, domain: { 'domain' => 'invalid value' } }, valid_session
        expect(assigns(:domain)).to eq(domain)
      end

      it 're-renders the "edit" template' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Domain).to receive(:save).and_return(false)
        put :update, { id: domain.to_param, domain: { 'domain' => 'invalid value' } }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

end
