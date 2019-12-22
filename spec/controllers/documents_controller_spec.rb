# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:folder) { create(:folder) }
  let(:valid_attributes) do
    { folder_id: folder.id, name: 'some doc', content: 'loren' }
  end
  let(:invalid_attributes) do
    { name: 'some doc', content: 'loren' }
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

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Document' do
        expect do
          post :create, params: { document: valid_attributes }, session: valid_session
        end.to change(Document, :count).by(1)
      end

      it 'renders a JSON response with the new document' do
        post :create, params: { document: valid_attributes }, session: valid_session
        expect(response.location).to eq(document_url(Document.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new document' do
        post :create, params: { document: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested document' do
        document = Document.create! valid_attributes
        put :update, params: { id: document.to_param, document: new_attributes }, session: valid_session
        document.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the document' do
        document = Document.create! valid_attributes

        put :update, params: { id: document.to_param, document: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the document' do
        document = Document.create! valid_attributes

        put :update, params: { id: document.to_param, document: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested document' do
      document = Document.create! valid_attributes
      expect do
        delete :destroy, params: { id: document.to_param }, session: valid_session
      end.to change(Document, :count).by(-1)
    end
  end
end
