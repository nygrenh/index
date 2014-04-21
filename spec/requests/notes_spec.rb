require 'spec_helper'

describe "Notes" do
  describe "GET /notes" do
    it "redirects user if not signed in" do
      get notes_path
      response.status.should be(302)
    end
  end
end
