require 'rails_helper'

RSpec.describe Client, type: :model do
  describe Client do
  describe '#valid_first_name?' do
    let!(:client) { create(:client) }
    let(:first_name) { client.first_name }

    context 'with valid first_name' do
      it 'returns truthy' do
        expect(client.valid_first_name?(first_name)).to eq true
      end
    end

    context 'with invalid first_name' do
      let(:invalid_first_name) { 'abce' }

      it 'returns falsy' do
        expect(client.valid_first_name?(invalid_first_name)).to eq false
      end
    end
  end

  describe '#create' do
    context 'with valid params' do
      let(:params) { { client_number: '0123456789', first_name: 'abcd' } }

      it 'returns created client' do
        client = described_class.create!(params)
        expect(client.id).not_to eq nil
      end
    end

    context 'with invalid params' do
      let(:without_client_number) { { first_name: 'abcd' } }
      let(:without_first_name) { { client_number: '0123456789' } }

      it 'validates presence of client_number attribute' do
        expect{described_class.create!(without_client_number)}.to raise_error ActiveRecord::RecordInvalid
      end

      it 'validates presence of first_name attribute' do
        expect{described_class.create!(without_first_name)}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
end
