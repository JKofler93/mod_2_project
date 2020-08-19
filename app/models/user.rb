class User < ApplicationRecord
    has_many :user_currencies
    has_many :currencies, through: :user_currencies 

    # def crypto_array
    #     self.currencies.map {|currency| currency.crypto}.uniq
    # end

    # def sort_by(name)
    #     self.user_currencies.map do |user_currency|
    #        if user_currency.currency.crypto == name
    #             user_currency.currency
    #         end
    #     end
    # end

    


end
