require 'rails_helper'

describe "Tags" do
  describe "GET /tags" do
    it "redirects user if not signed in" do
      get tags_path
      expect(response.status).to be(302)
    end
  end
end
