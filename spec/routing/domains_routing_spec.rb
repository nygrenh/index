require 'spec_helper'

describe DomainsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get('/domains')).to route_to('domains#index')
    end

    it "doesn't route to #new" do
      expect(get('/domains/new')).not_to route_to('domains#new')
    end

    it 'routes to #show' do
      expect(get('/domains/1')).to route_to('domains#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get('/domains/1/edit')).to route_to('domains#edit', id: '1')
    end

    it "doesn't route to #create" do
      expect(post('/domains')).not_to route_to('domains#create')
    end

    it 'routes to #update' do
      expect(put('/domains/1')).to route_to('domains#update', id: '1')
    end

    it "doesn't route to #destroy" do
      expect(delete('/domains/1')).not_to route_to('domains#destroy', id: '1')
    end
  end
end
