require 'rails_helper'

describe "Domains" do
  describe "GET /domains" do
    it "redirects user if not signed in" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get domains_path
      expect(response.status).to be(302)
    end
  end
end
