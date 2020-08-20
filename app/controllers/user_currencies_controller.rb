class UserCurrenciesController < ApplicationController
 
  def index
    @user_currencies = UserCurrency.all
  end

  def show
    @user_currency = UserCurrency.find(params[:id])
    @user = @user_currency.user
  end

  def new
    @user_currency = UserCurrency.new
    @users = User.all
    @currencies = Currency.all
  end

  def create 
    @user_currency = UserCurrency.create(user_currencies_params)
    @user = @user_currency.user
    @amount = @user_currency.amount
    @user.balance = @user.balance - @amount
    @user.save
    redirect_to user_currency_path(@user_currency)
  end

  private

  def user_currencies_params
    params.require(:user_currency).permit(:amount, :user_id, :currency_id)    
  end

end
