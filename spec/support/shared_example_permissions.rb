shared_examples 'a private resource' do
  describe "accessing something you don't own" do
    let(:user) { FactoryGirl.create(:user) }
    let(:another_user) { FactoryGirl.create(:user, name: 'Smith') }
    let!(:resource) { FactoryGirl.create(described_class, user_id: another_user.id) }

    before :each do
      log_in(name: user.name, password: user.password)
    end

    it 'is not possible' do
      expect { visit url_for(resource) }.to raise_exception
    end
  end
end
