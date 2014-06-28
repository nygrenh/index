require 'rails_helper'

describe "Users" do
  describe "GET /users" do
    it "redirects user if not signed in" do
      get users_path
      expect(response.status).to be(302)
    end
  end
end
