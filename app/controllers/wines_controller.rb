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
      redirect_to root_path
    end
  end

  def show
    @wine = Wine.find(params[:id])
    
  end

  def index
    @wines = Wine.all
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
