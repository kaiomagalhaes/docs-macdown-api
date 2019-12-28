# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::DocumentsController, type: :controller do
  login_user

  let(:folder) { FactoryBot.create(:folder) }
  let(:valid_attributes) do
    { folder_id: folder.id, name: 'some doc', content: 'loren' }
  end
  let(:invalid_attributes) do
    { name: nil }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Document' do
        expect do
          post :create, params: { document: valid_attributes }
        end.to change(Document, :count).by(1)
      end

      it 'renders a JSON response with the new document' do
        post :create, params: { document: valid_attributes }
        expect(response.location).to eq(document_url(Document.last))
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
        put :update, params: { id: document.to_param, document: new_attributes }
        document.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the document' do
        document = Document.create! valid_attributes

        put :update, params: { id: document.to_param, document: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested document' do
      document = Document.create! valid_attributes
      expect do
        delete :destroy, params: { id: document.to_param }
      end.to change(Document, :count).by(-1)
    end
  end
end
