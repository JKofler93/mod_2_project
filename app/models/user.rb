class User < ApplicationRecord
    has_many :user_currencies
    has_many :currencies, through: :user_currencies 

    def amount_hash
        self.user_currencies.map do |user_currency|
         {user_currency.currency.crypto => user_currency.amount }
        end   
    end

    # def sort_by(name)
    #     self.user_currencies.map do |user_currency|
    #        if user_currency.currency.crypto == name
    #             user_currency.currency
    #         end
    #     end
    # # end

    def total_amounts
        total_amounts = self.amount_hash.each_with_object(Hash.new(0)) do |key, value|
        if key
            key[value] += value
        end
     end
    end

    


end
