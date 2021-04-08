class Cryptocurrency < ApplicationRecord
    has_many :followers, as: :followable

    has_many :wallets
end
