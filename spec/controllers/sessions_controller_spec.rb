# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST /login', type: :request do
    let(:user) { FactoryBot.create(:user) }
    let(:url) { '/login' }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    context 'when params are correct' do
      before do
        post url, params: params
      end

      it 'returns 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end

      it 'returns valid JWT token' do
        token_from_request = response.headers['Authorization'].split(' ').last
        decoded_token = JWT.decode(token_from_request, DocumentationMacdownApi::Application.credentials.DEVISE_SECRET_KEY, true)
        expect(decoded_token.first['sub']).to be_present
      end
    end

    context 'when login params are incorrect' do
      before { post url }

      it 'returns unauthorized status' do
        expect(response.status).to eq 401
      end
    end
  end

  describe 'DELETE /logout', type: :request do
    let(:url) { '/logout' }

    it 'returns 204, no content' do
      delete url
      expect(response).to have_http_status(:no_content)
    end
  end
end
