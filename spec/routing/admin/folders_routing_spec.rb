# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::FoldersController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/admin/folders').to route_to('admin/folders#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/folders/1').to route_to('admin/folders#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/folders/1').to route_to('admin/folders#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/folders/1').to route_to('admin/folders#destroy', id: '1')
    end
  end
end
