require 'rails_helper'

RSpec.describe ClientController, type: :controller do
  describe 'POST create' do
    let(:params) {{client: attributes_for(:client)}}
    it 'return created user id' do
      post :create, params: params
      expect(response_body_as_json['name']).not_to eq nil
    end
  end
end
