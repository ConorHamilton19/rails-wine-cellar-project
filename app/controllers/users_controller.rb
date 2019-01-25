class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def show
    if !authentication_required
      @user = User.find(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
