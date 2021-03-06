class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follows, foreign_key: :follower_id 
  has_many :cryptocurrencies, through: :follows, source: :followable, source_type: 'Cryptocurrency'
  
  has_many :wallets, through: :follows, source: :followable, source_type: 'Wallet'

end
