class User < ApplicationRecord
    has_many :user_currencies
    has_many :currencies, through: :user_currencies 
    # has_secure_password
    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :password_digest, presence: true


    def own_amounts
        hash_totals = {}

        self.user_currencies.each do |uc|
           if hash_totals[uc.currency.crypto]
                hash_totals[uc.currency.crypto][:amount] = hash_totals[uc.currency.crypto][:amount] + uc.amount.to_i
           else
                hash_totals[uc.currency.crypto] =  { amount: uc.amount }
            end
        end
        hash_totals
    end

    def total_owned_cryptos
        hash_totals = self.own_amounts
   
        hash_totals.each do |crypto, amount|
            
            crypto_value = Currency.find_by(crypto: crypto).price
            hash_totals[crypto][:price] = crypto_value

        end
        hash_totals
    end
        
end
