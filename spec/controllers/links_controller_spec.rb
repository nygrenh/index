require 'rails_helper'

describe LinksController do

  # This should return the minimal set of attributes required to create a valid
  # Link. As you add validations to Link, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "url" => "http://example.com/", "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LinksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    user = User.create name:"Test", password:"test", password_confirmation:"test"
    session[:user_id] = user.id
  end

  describe "GET index" do
    it "assigns links as @links" do
      link = Link.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET show" do
    it "assigns the requested link as @link" do
      link = Link.create! valid_attributes
      get :show, {:id => link.to_param}, valid_session
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "GET new" do
    it "assigns a new link as @link" do
      get :new, {}, valid_session
      expect(assigns(:link)).to be_a_new(Link)
    end
  end

  describe "GET edit" do
    it "assigns the requested link as @link" do
      link = Link.create! valid_attributes
      get :edit, {:id => link.to_param}, valid_session
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, {:link => valid_attributes}, valid_session
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, {:link => valid_attributes}, valid_session
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it "redirects to the created link" do
        post :create, {:link => valid_attributes}, valid_session
        expect(response).to redirect_to(Link.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        post :create, {:link => { "title" => "invalid value" }}, valid_session
        expect(assigns(:link)).to be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        post :create, {:link => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested link" do
        link = Link.create! valid_attributes
        # Assuming there are no other links in the database, this
        # specifies that the Link created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Link).to receive(:update).with({ "title" => "MyString" })
        put :update, {:id => link.to_param, :link => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested link as @link" do
        link = Link.create! valid_attributes
        put :update, {:id => link.to_param, :link => valid_attributes}, valid_session
        expect(assigns(:link)).to eq(link)
      end

      it "redirects to the link" do
        link = Link.create! valid_attributes
        put :update, {:id => link.to_param, :link => valid_attributes}, valid_session
        expect(response).to redirect_to(link)
      end
    end

    describe "with invalid params" do
      it "assigns the link as @link" do
        link = Link.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        put :update, {:id => link.to_param, :link => { "title" => "invalid value" }}, valid_session
        expect(assigns(:link)).to eq(link)
      end

      it "re-renders the 'edit' template" do
        link = Link.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Link).to receive(:save).and_return(false)
        put :update, {:id => link.to_param, :link => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested link" do
      link = Link.create! valid_attributes
      expect {
        delete :destroy, {:id => link.to_param}, valid_session
      }.to change(Link, :count).by(-1)
    end

    it "redirects to the links list" do
      link = Link.create! valid_attributes
      delete :destroy, {:id => link.to_param}, valid_session
      expect(response).to redirect_to(links_url)
    end
  end

end
