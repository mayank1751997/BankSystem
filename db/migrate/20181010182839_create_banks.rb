class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :bank_name
      t.string :bank_address
      t.integer :contact_number
      t.timestamps
    end
  end
end
