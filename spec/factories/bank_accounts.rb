FactoryBot.define do
  factory :bank_account do
    account_number {FactoryBot.create(:bank).bank_name}
    client_name {FactoryBot.create(:client).client_name}
    balance {FactoryBot.create(:balance).balance}
    
  end
end
