class UserWinesController < ApplicationController
  def edit
    @user_wine = UserWine.find(params[:id])
  end

  def update
    @user_wine = UserWine.find(params[:id])
    @user_wine.update(uncorked: params[:uncorked])
    redirect_to wines_path
  end


end
