FactoryBot.define do
  factory :bank do
    bank_name Faker::Bank.bank_name
    bank_address Faker::Bank_address.bank_address
    contact_number Faker::Contact_number.contact_number
    
  end
end
