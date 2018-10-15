require 'rails_helper'

RSpec.describe Bankbank_accountController, type: :controller do
  let!(:client) { create(:client) }
  let!(:bank_account) { create(:bank_account, client_name: client.name) }
  let(:token) { JwtToken.encode({client_name: client.name}) }

  describe 'POST create' do
    context 'with valid params' do
      let(:params) { { bank_account: attributes_for(:bank_account, client_name: client.name) } }

      it 'returns created status' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :create, params: params, as: :json
        expect(response).to have_http_status(:created)
      end
    end
  end

end
