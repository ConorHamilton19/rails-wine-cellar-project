class WinesController < ApplicationController
    before_action :authentication_required


  def new
    @wine = Wine.new(type_id: params[:type_id])
  end

  def create
    @wine = Wine.find_or_create_by(wine_params)
      current_user.wines << @wine
      respond_to do |f|
				f.html {redirect_to wines_path}
				f.json {render json: @wine, status: 201}
      end
  end

  def show
    @wine = Wine.find(params[:id])
    @user_wine = UserWine.find_by(wine_id: @wine.id, user_id: current_user.id)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @wine, status: 200}
    end
  end

  def index
    @wines = current_user.wines
    @wines_corked = Wine.bottle_corked & current_user.wines
    @wines_drank = Wine.bottle_drank & current_user.wines
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @wines, status: 200}
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    redirect_to wine_path(@wine)
  end

  def destroy
    @wine = Wine.find(params[:id])
    @user_wine = UserWine.find_by(wine_id: @wine.id, user_id: current_user.id)
    @user_wine.destroy
    redirect_to wines_path
  end

  def popular
    @wines = Wine.all
  end

  private

  def wine_params

    params.require(:wine).permit(:name, :year, :price, :type_id, :type_name)
  end

end
