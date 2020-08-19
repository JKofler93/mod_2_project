class User < ApplicationRecord
    has_many :user_currencies
    has_many :currencies, through: :user_currencies 

    def crypto_array
        self.currencies.map{|currency| currency.crypto}.uniq
    end

    def sort_by_crypto

     self.user_currencies.map do |uc|
        uc.currency.crypto == self.crypto_array[0]
         uc.amount
    
     end
    end


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
