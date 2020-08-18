class User < ApplicationRecord
    has_many :user_currencies
    has_many :currencies, through: :user_currencies 
end
