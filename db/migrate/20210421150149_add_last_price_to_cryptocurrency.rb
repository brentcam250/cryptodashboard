class AddLastPriceToCryptocurrency < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptocurrencies, :last_price, :decimal
    add_column :cryptocurrencies, :last_price_date, :datetime 

  end
end
