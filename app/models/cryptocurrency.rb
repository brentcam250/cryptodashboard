class Cryptocurrency < ApplicationRecord
    has_many :followers, as: :followable
end
