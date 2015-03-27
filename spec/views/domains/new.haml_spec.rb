require 'rails_helper'

describe 'domains/new' do
  before(:each) do
    assign(:domain, stub_model(Domain,
                               domain: 'MyString',
                               description: 'MyText'
    ).as_new_record)
  end

  it 'renders new domain form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', domains_path, 'post' do
      assert_select 'textarea#domain_description[name=?]', 'domain[description]'
    end
  end
end
