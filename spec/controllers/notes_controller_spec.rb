require 'rails_helper'

describe NotesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }
  let(:valid_attributes) { FactoryGirl.attributes_for(:note) }
  let!(:note) { FactoryGirl.create(:note, user_id: user.id) }

  describe 'GET index' do
    it 'assigns all notes as @notes' do
      get :index, {}, valid_session
      expect(assigns(:notes)).to eq([note])
    end
  end

  describe 'GET show' do
    it 'assigns the requested note as @note' do
      get :show, { id: note.to_param }, valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe 'GET new' do
    it 'assigns a new note as @note' do
      get :new, {}, valid_session
      expect(assigns(:note)).to be_a_new(Note)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested note as @note' do
      get :edit, { id: note.to_param }, valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Note' do
        expect do
          post :create, { note: valid_attributes }, valid_session
        end.to change(Note, :count).by(1)
      end

      it 'assigns a newly created note as @note' do
        post :create, { note: valid_attributes }, valid_session
        expect(assigns(:note)).to be_a(Note)
        expect(assigns(:note)).to be_persisted
      end

      it 'redirects to the created note' do
        post :create, { note: valid_attributes }, valid_session
        expect(response).to redirect_to(Note.last)
      end

      it 'sets note owner' do
        post :create, { note: valid_attributes }, valid_session
        expect(assigns(:note).user_id).to eq(user.id)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved note as @note' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Note).to receive(:save).and_return(false)
        post :create, { note: { 'name' => 'invalid value' } }, valid_session
        expect(assigns(:note)).to be_a_new(Note)
      end

      it 're-renders the "new" template' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Note).to receive(:save).and_return(false)
        post :create, { note: { 'name' => 'invalid value' } }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested note' do
        expect_any_instance_of(Note).to receive(:update).with('name' => 'MyString')
        put :update, { id: note.to_param, note: { 'name' => 'MyString' } }, valid_session
      end

      it 'assigns the requested note as @note' do
        put :update, { id: note.to_param, note: valid_attributes }, valid_session
        expect(assigns(:note)).to eq(note)
      end

      it 'redirects to the note' do
        put :update, { id: note.to_param, note: valid_attributes }, valid_session
        expect(response).to redirect_to(note)
      end
    end

    describe 'with invalid params' do
      it 'assigns the note as @note' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Note).to receive(:save).and_return(false)
        put :update, { id: note.to_param, note: { 'name' => 'invalid value' } }, valid_session
        expect(assigns(:note)).to eq(note)
      end

      it 're-renders the "edit" template' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Note).to receive(:save).and_return(false)
        put :update, { id: note.to_param, note: { 'name' => 'invalid value' } }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested note' do
      expect do
        delete :destroy, { id: note.to_param }, valid_session
      end.to change(Note, :count).by(-1)
    end

    it 'redirects to the notes list' do
      delete :destroy, { id: note.to_param }, valid_session
      expect(response).to redirect_to(notes_url)
    end
  end
end
