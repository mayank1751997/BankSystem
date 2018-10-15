FactoryBot.define do
  factory :client do
    client_name Faker::Client_name.client_name
    client_number Faker::Client_number.client_number(10)
    client_dob Faker::Client_dob.client_dob
    client_address Faker::Client_address.client_address

  end
end
