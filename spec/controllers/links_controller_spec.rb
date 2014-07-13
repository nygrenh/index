require 'rails_helper'

describe LinksController do

  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }
  let(:valid_attributes) { FactoryGirl.attributes_for(:link) }
  let!(:link) { FactoryGirl.create(:link, user_id: user.id) }

  describe 'GET index' do
    it 'assigns links as @links' do
      get :index, {}, valid_session
      expect(assigns(:links)).to eq([link])
    end
  end

  describe 'GET show' do
    it 'assigns the requested link as @link' do
      get :show, { id: link.to_param }, valid_session
      expect(assigns(:link)).to eq(link)
    end
  end

  describe 'GET new' do
    it 'assigns a new link as @link' do
      get :new, {}, valid_session
      expect(assigns(:link)).to be_a_new(Link)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested link as @link' do
      get :edit, { id: link.to_param }, valid_session
      expect(assigns(:link)).to eq(link)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Link' do
        expect {
          post :create, { link: valid_attributes }, valid_session
        }.to change(Link, :count).by(1)
      end

      it 'assigns a newly created link as @link' do
        post :create, { link: valid_attributes }, valid_session
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it 'redirects to the created link' do
        post :create, { link: valid_attributes }, valid_session
        expect(response).to redirect_to(Link.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved link as @link' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        post :create, { link: { 'title' => 'invalid value' } }, valid_session
        expect(assigns(:link)).to be_a_new(Link)
      end

      it 're-renders the "new" template' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        post :create, { link: { 'title' => 'invalid value' } }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested link' do
        expect_any_instance_of(Link).to receive(:update).with('title' => 'MyString')
        put :update, { id: link.to_param, link: { 'title' => 'MyString' } }, valid_session
      end

      it 'assigns the requested link as @link' do
        put :update, { id: link.to_param, link: valid_attributes }, valid_session
        expect(assigns(:link)).to eq(link)
      end

      it 'redirects to the link' do
        put :update, { id: link.to_param, link: valid_attributes }, valid_session
        expect(response).to redirect_to(link)
      end
    end

    describe 'with invalid params' do
      it 'assigns the link as @link' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        put :update, { id: link.to_param, link: { 'title' => 'invalid value' } }, valid_session
        expect(assigns(:link)).to eq(link)
      end

      it 're-renders the "edit" template' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        put :update, { id: link.to_param, link: { 'title' => 'invalid value' } }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested link' do
      expect {
        delete :destroy, { id: link.to_param }, valid_session
      }.to change(Link, :count).by(-1)
    end

    it 'redirects to the links list' do
      delete :destroy, { id: link.to_param }, valid_session
      expect(response).to redirect_to(links_url)
    end
  end

end
