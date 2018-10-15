class Bank < ApplicationRecord
  has_many :bank_accounts
  has_many :bank_transactions
  validates :bank_name, presence: true
  validates :bank_address, presence: true
  validates :contact_number, presence: true
end
