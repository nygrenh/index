require 'rails_helper'

describe 'domains/edit' do
  before(:each) do
    @domain = assign(:domain, stub_model(Domain,
                                         domain: 'MyString',
                                         description: 'MyText'
                                        ))
  end

  it 'renders the edit domain form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', domain_path(@domain), 'post' do
      assert_select 'textarea#domain_description[name=?]', 'domain[description]'
    end
  end
end
