class User < ApplicationRecord
    has_many :user_currencies
    has_many :currencies, through: :user_currencies 

    def own_amounts
        hash_totals = {}

        self.user_currencies.each do |uc|
           if hash_totals[uc.currency.crypto]
                hash_totals[uc.currency.crypto][:amount] = hash_totals[uc.currency.crypto][:amount] + uc.amount
           else
                hash_totals[uc.currency.crypto] =  {amount: uc.amount}
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


    # def sort_by_crypto(name)
    #     var = 0
    #     i = 0

    #     while i < self.user_currencies.length do
    #         self.user_currencies.map do |uc|
                
    #             if uc.currency.crypto == self.crypto_array[i]
    #                 var += uc.amount
    #             end
    #             i += 1
    #         end
    #     end
    #     var
    # end




    # def amount_array     ###ARRAY OF KEY VALUE PAIRS  EXAMPLE:  BITCOIN => 100
    #     self.user_currencies.map do |user_currency|
    #         {user_currency.currency.crypto => user_currency.amount}
    #     end
    # end

    # def add_amounts
    #     var = self.amount_array 
    #     i = 0

    #     while i < var.length do
    #     j = 0 

    #         while j < var.length do
        
    #                 if self.amount_array[i].keys == self.amount_array[j].keys
    #                     puts "#{self.amount_array[i].keys}"
    #                     puts "#{self.amount_array[i].values}"
    #                 end
                
    #         j += 1  
    #         end
    #     i += 1
    #     end
    # end
        



    



    def buy_currency
        if balance >=  grand_total
        grand_total - balance
        #else 
        #flash error: "Not enough money in your account"
        # flash[:spam] = @instance.errors.full_messages
        end
    end 

    def sell_currency
    end


end
