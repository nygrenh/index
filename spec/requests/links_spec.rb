require 'rails_helper'

describe 'Links' do
  describe 'GET /links response' do
    subject(:response) { get domains_path }
    context 'if not logged in' do
      it { is_expected.to be(302) }
    end
  end
end
