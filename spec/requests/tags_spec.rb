require 'spec_helper'

describe "Tags" do
  describe "GET /tags" do
    it "redirects user if not signed in" do
      get tags_path
      response.status.should be(302)
    end
  end
end
