class UserCurrenciesController < ApplicationController
  def index
    @user_currencies = UserCurrency.all
  end

  def show
    @user_currency = UserCurrency.find(params[:id])
  end

  def new
    @user_currency = UserCurrency.new
    @users = User.all
    @currencies = Currency.all
  end

  def create
    @user_currency = UserCurrency.create(user_currencies_params)
    redirect_to user_currency_path(@user_currency)
  end

  # def edit    ### USER SHOULD NOT BE ABLE TO EDIT USERCURRENCY FROM DATABASE !!!
  #   @user = UserCurrency.find(params[:id])
  # end
    
  # def update   ### USER SHOULD NOT BE ABLE TO UPDATE USERCURRENCY FROM DATABASE !!!
  #   @user = UserCurrency.find(params[:id])
  #   @user.update(user_currencies_params
  #   redirect_to user_currencies_path(@user)
  # end

  # def destroy   ### USER SHOULD NOT BE ABLE TO DELETE USERCURRENCY FROM DATABASE !!!
  # end

  private

  def user_currencies_params
    params.require(:user_currency).permit(:amount, :user_id, :currency_id)    
  end

end
