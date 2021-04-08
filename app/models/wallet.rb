class Wallet < ApplicationRecord
    has_many :followers, as: :followable

    belongs_to :cryptocurrency
end
