class CreateBankTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_transactions do |t|
      t.decimal :amount
      t.string :transaction_type
      t.references :bank_account, foreign_key: true
      t.string :date
      t.timestamps
    end
  end
end
