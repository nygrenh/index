require 'rails_helper'

describe DomainsController do

  # This should return the minimal set of attributes required to create a valid
  # Domain. As you add validations to Domain, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { :domain => "", "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DomainsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    user = User.create name:"Test", password:"test", password_confirmation:"test"
    session[:user_id] = user.id
  end

  describe "GET index" do
    it "assigns all domains as @domains" do
      domain = Domain.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:domains)).to eq([domain])
    end
  end

  describe "GET show" do
    it "assigns the requested domain as @domain" do
      domain = Domain.create! valid_attributes
      get :show, {:id => domain.to_param}, valid_session
      expect(assigns(:domain)).to eq(domain)
    end
  end

  describe "GET edit" do
    it "assigns the requested domain as @domain" do
      domain = Domain.create! valid_attributes
      get :edit, {:id => domain.to_param}, valid_session
      expect(assigns(:domain)).to eq(domain)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested domain" do
        domain = Domain.create! valid_attributes
        # Assuming there are no other domains in the database, this
        # specifies that the Domain created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Domain).to receive(:update).with({ "description" => "MyString" })
        put :update, {:id => domain.to_param, :domain => { "description" => "MyString" }}, valid_session
      end

      it "assigns the requested domain as @domain" do
        domain = Domain.create! valid_attributes
        put :update, {:id => domain.to_param, :domain => valid_attributes}, valid_session
        expect(assigns(:domain)).to eq(domain)
      end

      it "redirects to the domain" do
        domain = Domain.create! valid_attributes
        put :update, {:id => domain.to_param, :domain => valid_attributes}, valid_session
        expect(response).to redirect_to(domain)
      end
    end

    describe "with invalid params" do
      it "assigns the domain as @domain" do
        domain = Domain.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Domain.any_instance.stub(:save).and_return(false)
        put :update, {:id => domain.to_param, :domain => { "domain" => "invalid value" }}, valid_session
        expect(assigns(:domain)).to eq(domain)
      end

      it "re-renders the 'edit' template" do
        domain = Domain.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Domain.any_instance.stub(:save).and_return(false)
        put :update, {:id => domain.to_param, :domain => { "domain" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

end
