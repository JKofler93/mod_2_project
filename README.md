Triganic Pu


Creators: Samuel L. , Joseph K.

Description: a crypto currency web application. User’s can buy & sell crypto currency.
MOD: 2
Cohort Name: 071320

Domains:
User
:user_name#
:age#
:email                                          ####email_field
:password (potentially)                         ###password_field
:balance (starting amount in US dollar)

UserCurrency
:amount (in US dollars)
:user_id
:currency_id 

Currency
:Type (type of crypto currency)
:price (value of 1 unit of currency in USD) //Seed top 20 currencies from API!!!

User Relationships
Has many currencies, through user_currencies
Has many user_currencies

Currency Relationships
Has many users , through user_currencies
Has many user_currencies	

UserCurrency Relationships
belongs to user
belongs to currency

User story:
- a user can log in
- a user needs a Password to long in
- a user can buy a currency
- a user can sell a currency
- XXXa user can view their current balance
- XXXa user can view their owned crypto currencies
- XXXa user  can view their past transactions
- XXXa user can edit their profile 
- XXXa user can delete their profile 

Additonal:
-Use API to seed currency
- custom tracker feature: buy x amount of y currency at z price. 







CUT OUT:

<label>Sub Total:</label><br>
<%='$'%><%= @user_currency.crypto_total %><br><br>

<label>Taxes:</label><br>
<%='$'%><%= @user_currency.taxes %><br><br>

<label>Grand Total:</label><br>
<%='$'%><%= @user_currency.grand_total %><br><br>
