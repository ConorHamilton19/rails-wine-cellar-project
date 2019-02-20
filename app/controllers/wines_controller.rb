class WinesController < ApplicationController
    before_action :authentication_required


  def new
    @wine = Wine.new(type_id: params[:type_id])
  end

  def create
    @wine = Wine.find_or_create_by(wine_params)

    if @wine.save
      current_user.wines << @wine
      redirect_to wine_path(@wine)
    else
      render 'wines/new'
    end
  end

  def show
    @wine = Wine.find(params[:id])
    @user_wine = UserWine.find_by(wine_id: @wine.id, user_id: current_user.id)
  end

  def index
    @wines = current_user.wines
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @wines.to_json }
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
    @wine.destroy
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
