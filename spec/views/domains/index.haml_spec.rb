require 'rails_helper'

describe 'domains/index.haml' do
  before(:each) do
    assign(:domains, [
      stub_model(Domain,
                 name: 'Domain',
                 description: 'MyText'
                ),
      stub_model(Domain,
                 name: 'Domain',
                 description: 'MyText'
                )
    ])
  end

  it 'renders a list of domains' do
    render
    assert_select 'tr>td', text: 'Domain'.to_s, count: 2
  end
end
