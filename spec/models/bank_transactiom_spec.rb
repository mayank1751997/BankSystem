require 'rails_helper'

RSpec.describe BankTransactiom, type: :model do
  describe '#deposit' do
   context 'with valid params' do
     it 'deposit into bank_account' do
       deposited = described_class.deposit(bank_account, 9.99)
       expect(deposited).to eq true
     end
   end

   context 'when amount <= 0' do
     it 'returns falsy' do
       deposited = described_class.deposit(bank_account, 0.00)
       expect(deposited).to eq false
     end
   end
 end

 describe '#withdraw' do
   context 'with valid params' do
     it 'withdraw from bank_account' do
       withdrawn = described_class.withdraw(bank_account, 9.99)
       expect(withdrawn).to eq true
     end
   end

   context 'when amount <= 0' do
     it 'returns falsy' do
       withdrawn = described_class.withdraw(bank_account, 0.00)
       expect(withdrawn).to eq false
     end
   end
 end

 describe '#transfer' do
   let!(:client_recipient) { create(:client, client_number: '0123456789') }
   let(:params_recipient) { attributes_for(:bank_account, client_name: client_recipient.name) }
   let!(:recipient) { create(:bank_account, params_recipient) }

   context 'with valid params' do
     it 'transfer from one bank_account to another bank_account' do
       transfered = described_class.transfer(bank_account, recipient, 9.99)
       expect(transfered).to eq true
     end
   end

   context 'when amount <= 0' do
     it 'returns false' do
       transfered = described_class.transfer(bank_account, recipient, 0.00)
       expect(transfered).to eq false
     end
   end
 end
end
