require 'rails_helper'

describe TagsController do

  # This should return the minimal set of attributes required to create a valid
  # Tag. As you add validations to Tag, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString", "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    user = User.create name:"Test", password:"test", password_confirmation:"test"
    session[:user_id] = user.id
  end

  describe "GET index" do
    it "assigns all tags as @tags" do
      tag = Tag.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tags)).to eq([tag])
    end
  end

  describe "GET show" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :show, {:id => tag.to_param}, valid_session
      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe "GET edit" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :edit, {:id => tag.to_param}, valid_session
      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tag" do
        tag = Tag.create! valid_attributes
        # Assuming there are no other tags in the database, this
        # specifies that the Tag created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Tag).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => tag.to_param, :tag => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested tag as @tag" do
        tag = Tag.create! valid_attributes
        put :update, {:id => tag.to_param, :tag => valid_attributes}, valid_session
        expect(assigns(:tag)).to eq(tag)
      end

      it "redirects to the tag" do
        tag = Tag.create! valid_attributes
        put :update, {:id => tag.to_param, :tag => valid_attributes}, valid_session
        expect(response).to redirect_to(tag)
      end
    end

    describe "with invalid params" do
      it "assigns the tag as @tag" do
        tag = Tag.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        put :update, {:id => tag.to_param, :tag => { "name" => "invalid value" }}, valid_session
        expect(assigns(:tag)).to eq(tag)
      end

      it "re-renders the 'edit' template" do
        tag = Tag.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        put :update, {:id => tag.to_param, :tag => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

end
