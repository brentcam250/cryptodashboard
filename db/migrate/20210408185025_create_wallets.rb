class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :address
      t.integer :cryptocurrency_id 

      t.timestamps
    end
  end
end
