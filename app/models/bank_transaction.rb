class BankTransaction < ApplicationRecord
  belongs_to :bank_account

  TRANSATION_TYPE = ["withdraw", "deposit"]

  validates :bank_account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_type, presence: true, inclusion: {in: TRANSATION_TYPE}

  validates_presence_of :Transaction

  def self.deposit(account, amount)
    puts "Depositing #{amount} on account #{account.id}"
    return false unless self.amount_valid?(amount)
    account.balance = (account.balance +=amount).round(2)
    account.save!
  end

  def self.withdraw(account, amount)
    puts "withdrawing #{amount} on account #{account.id}"
    return false unless self.amount_valid?(amount)
    account_balance = (account.balance += amount).round(2)
    account.save!
  end

  def self.transfer(account, recipient, amount)
    puts "transfering #{amount} from account #{account.id} to account #{recipient.id}"
    return false unless self.amount_valid?(amount)
    ActiveRecord::Base.transaction do
      self.withdraw(account, amount)
      self.deposit(recipient, amount)
    end

  end

  private
  def self.amount_valid?(amount)
    if amount <= 0
      puts 'Transaction faild! amount must be greater than 0.00'
      return false
    end
  return true

  end
end
