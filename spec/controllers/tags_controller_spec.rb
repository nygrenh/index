require 'rails_helper'

describe TagsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }
  let(:valid_attributes) { FactoryGirl.attributes_for(:tag) }
  let!(:tag) { FactoryGirl.create(:tag, user_id: user.id) }

  describe 'GET index' do
    it 'assigns all tags as @tags' do
      get :index, {}, valid_session
      expect(assigns(:tags)).to eq([tag])
    end
  end

  describe 'GET show' do
    it 'assigns the requested tag as @tag' do
      get :show, { id: tag.to_param }, valid_session
      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested tag as @tag' do
      get :edit, { id: tag.to_param }, valid_session
      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested tag' do
        expect_any_instance_of(Tag).to receive(:update).with('name' => 'MyString')
        put :update, { id: tag.to_param, tag: { 'name' => 'MyString' } }, valid_session
      end

      it 'assigns the requested tag as @tag' do
        put :update, { id: tag.to_param, tag: valid_attributes }, valid_session
        expect(assigns(:tag)).to eq(tag)
      end

      it 'redirects to the tag' do
        put :update, { id: tag.to_param, tag: valid_attributes }, valid_session
        expect(response).to redirect_to(tag)
      end
    end

    context 'with a valid color' do
      it 'updates the tag' do
        expect_any_instance_of(Tag).to receive(:update).with('color' => 'warning')
        put :update, { id: tag.to_param, tag: { 'color' => 'warning' } }, valid_session
      end
    end

    describe 'with invalid params' do
      it 'assigns the tag as @tag' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Tag).to receive(:save).and_return(false)
        put :update, { id: tag.to_param, tag: { 'name' => 'invalid value' } }, valid_session
        expect(assigns(:tag)).to eq(tag)
      end

      it 're-renders the "edit" template' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Tag).to receive(:save).and_return(false)
        put :update, { id: tag.to_param, tag: { 'name' => 'invalid value' } }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

end
