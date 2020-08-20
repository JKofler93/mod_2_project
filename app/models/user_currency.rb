class UserCurrency < ApplicationRecord
    belongs_to :user
    belongs_to :currency

    def crypto_total
        total = self.currency.price * self.amount
        total.to_f
    end

    def taxes
      self.crypto_total.to_f * 4/100
    end

    def grand_total
        self.crypto_total + self.taxes
    end

    # def add_balance(value)
    #     self.user.balance + value
    # end

    # def minus_balance(value)
    #     self.user.balance + value
    # end


end
