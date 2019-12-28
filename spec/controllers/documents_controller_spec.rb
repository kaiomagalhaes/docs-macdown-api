# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:folder) { FactoryBot.create(:folder) }
  let(:valid_attributes) do
    { folder_id: folder.id, name: 'some doc', content: 'loren' }
  end
  let(:invalid_attributes) do
    { content: 'loren' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DocumentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Document.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      document = Document.create! valid_attributes
      get :show, params: { id: document.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end
end
