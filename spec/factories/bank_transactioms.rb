FactoryBot.define do
  factory :bank_transactiom do
    bank_account {FactoryBot.create(:bank).bank_account}
    amount {FactoryBot.create(:amount).amount}
    transaction_type {FactoryBot.create(:transaction).transaction_type}
  end
end
