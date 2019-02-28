class UsersController < ApplicationController
  before_action :authentication_required
  skip_before_action :authentication_required, only: [:new,:create]

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
      @user = User.find(params[:id])
    if session[:user_id] != @user.id
      redirect_to root_path
    end
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user, status: 200}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
