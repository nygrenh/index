require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "redirects user if not signed in" do
      get users_path
      response.status.should be(302)
    end
  end
end
