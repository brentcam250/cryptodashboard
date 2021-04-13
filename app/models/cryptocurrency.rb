class Cryptocurrency < ApplicationRecord
    has_many :followers, as: :followable

    has_many :wallets
    def symbol_name 
        "#{Cryptocurrency.symbol} - name"
    end
end
