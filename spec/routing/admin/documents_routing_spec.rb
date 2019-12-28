# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::DocumentsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/admin/documents').to route_to('admin/documents#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/documents/1').to route_to('admin/documents#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/documents/1').to route_to('admin/documents#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/documents/1').to route_to('admin/documents#destroy', id: '1')
    end
  end
end
