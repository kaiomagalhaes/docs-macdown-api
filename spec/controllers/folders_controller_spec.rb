# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoldersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Folder. As you add validations to Folder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'docs' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FoldersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Folder.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      folder = Folder.create! valid_attributes
      get :show, params: { id: folder.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end
end
