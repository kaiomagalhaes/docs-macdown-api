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

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Folder' do
        expect do
          post :create, params: { folder: valid_attributes }, session: valid_session
        end.to change(Folder, :count).by(1)
      end

      it 'renders a JSON response with the status created' do
        post :create, params: { folder: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
      end

      it 'renders a JSON response with the new folder' do
        post :create, params: { folder: valid_attributes }, session: valid_session
        expect(response.location).to eq(folder_url(Folder.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new folder' do
        post :create, params: { folder: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested folder' do
        folder = Folder.create! valid_attributes
        put :update, params: { id: folder.to_param, folder: new_attributes }, session: valid_session
        folder.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the folder' do
        folder = Folder.create! valid_attributes

        put :update, params: { id: folder.to_param, folder: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the folder' do
        folder = Folder.create! valid_attributes

        put :update, params: { id: folder.to_param, folder: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested folder' do
      folder = Folder.create! valid_attributes
      expect do
        delete :destroy, params: { id: folder.to_param }, session: valid_session
      end.to change(Folder, :count).by(-1)
    end
  end
end
