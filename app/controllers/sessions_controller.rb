class SessionsController < ApplicationController

  def new
     @user = User.new
  end


  def create
    if auth_hash = request.env["omniauth.auth"]
      name_search= auth_hash["info"]["name"]
      name = "#{name_search.partition(" ").first}"
      if  @user = User.find_by(name: name)
          session[:user_id] = @user.id
          redirect_to root_path
      else
        @user = User.new(name: name, password: SecureRandom.hex)
        if user.save
          session[:user_id] = @user.id
          redirect to root_path
        else
          raise @user.errors.full_messages.inspect
        end
      end

    else
      @user = User.find_by(name: params[:user][:name])
      if @user &&  @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
