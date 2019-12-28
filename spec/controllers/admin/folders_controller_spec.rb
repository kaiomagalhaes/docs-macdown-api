# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::FoldersController, type: :controller do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Folder. As you add validations to Folder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'docs' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Folder' do
        expect do
          post :create, params: { folder: valid_attributes }
        end.to change(Folder, :count).by(1)
      end

      it 'renders a JSON response with the status created' do
        post :create, params: { folder: valid_attributes }
        expect(response).to have_http_status(:created)
      end

      it 'renders a JSON response with the new folder' do
        post :create, params: { folder: valid_attributes }
        expect(response.location).to eq(folder_url(Folder.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new folder' do
        post :create, params: { folder: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_content) { 'new content' }
      let(:new_attributes) do
        { content: new_content }
      end

      it 'updates the requested folder' do
        folder = Folder.create! valid_attributes
        put :update, params: { id: folder.to_param, folder: new_attributes }
        folder.reload

        expect(folder.content).to eq(new_content)
      end

      it 'renders a JSON response with the folder' do
        folder = Folder.create! valid_attributes

        put :update, params: { id: folder.to_param, folder: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the folder' do
        folder = Folder.create! valid_attributes

        put :update, params: { id: folder.to_param, folder: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested folder' do
      folder = Folder.create! valid_attributes
      expect do
        delete :destroy, params: { id: folder.to_param }
      end.to change(Folder, :count).by(-1)
    end
  end
end
