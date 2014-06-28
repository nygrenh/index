require 'rails_helper'

describe "Notes" do
  describe "GET /notes" do
    it "redirects user if not signed in" do
      get notes_path
      expect(response.status).to be(302)
    end
  end
end
