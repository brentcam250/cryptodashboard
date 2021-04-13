class AddNameAndCryptoToWallets < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :name, :string 
  end
end
