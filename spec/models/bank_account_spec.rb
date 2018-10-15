require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  describe Bank_account do
  let!(:user) { create(:user) }
  let!(:bank_account) { create(:bank_account, client_name: user.id) }

  describe '#open' do
    context 'with valid params' do
      let(:params) { attributes_for(:bank_account, client_name: user.id) }

      it 'opens a new bank_account' do
        opened = described_class.open(params)
        expect(opened).to eq true
      end
    end

    context 'with invalid params' do
      let(:without_client_number) { { client_name: '123b' } }
      let(:without_client_name) { { client_number: '123456' } }

      it 'validates presence of name attribute' do
        expect{described_class.open(without_name)}.to raise_error ActiveRecord::RecordInvalid
      end

      it 'validates presence of client_name attribute' do
        expect{described_class.open(without_client_name)}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
