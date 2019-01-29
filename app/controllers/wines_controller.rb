class WinesController < ApplicationController
    before_action :authentication_required


  def new
    @wine = Wine.new(type_id: params[:type_id])
  end

  def create
    @wine = Wine.create(wine_params)

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
    @wines_drank = Wine.bottle_drank
    @wines_corked = Wine.bottle_corked
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

  private

  def wine_params

    params.require(:wine).permit(:name, :year, :price, :type_id, :type_name)
  end

end
