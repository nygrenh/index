shared_examples 'a private resource' do
  describe "accessing something you don't own" do
    let(:user) { FactoryGirl.create(:user) }
    let(:another_user) { FactoryGirl.create(:user, name: 'Smith') }
    let!(:resource) { FactoryGirl.create(resource_type, user_id: another_user.id) }

    before :each do
      log_in(name: user.name, password: user.password)
    end

    it 'is not possible' do
      visit url_for(resource)
      expect(page).to have_content("You don't have permission to do that.")
    end
  end
end
