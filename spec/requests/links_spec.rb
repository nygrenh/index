require 'rails_helper'

describe "Links" do
  describe "GET /links" do
    it "redirects user if not signed in" do
      get links_path
      response.status.should be(302)
    end
  end
end
