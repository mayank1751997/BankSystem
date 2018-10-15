require 'rails_helper'

RSpec.describe BankTransactionController, type: :controller do
  describe 'POST deposit' do
    context 'with valid params' do
      let(:params) { { name: client_name, amount: 9.99 } }

      it 'returns 200' do
        request.headers['Authorization'] = "Bearer #{token}"
        put :deposit, params: params, as: :json
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST withdraw' do
    context 'with valid params' do
      let(:params) { { name: client_name, amount: 9.99 } }

      it 'returns 200' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :withdraw, params: params, as: :json
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST transfer' do
    context 'with valid params' do
      let!(:client_recipient) { create(:client) }
      let!(:recipient) { create(:account, client_name:  client_recipient.id) }
      let(:params) { { name: client_name, recipient_id: recipient.id, amount: 5.00 } }

      it 'returns 200' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :transfer, params: params, as: :json
        expect(response).to have_http_status(:success)
      end
    end
  end
end
