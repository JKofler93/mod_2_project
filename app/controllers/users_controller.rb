class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_currencies = UserCurrency.all
  end

  def new
    @user = User.new
    @user.save
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to users_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
        redirect_to new_user_path
  end
end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      @user.update(user_params)
    
      if @user.valid?
        redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
        redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :age, :balance, :password_digest)
  end

end
