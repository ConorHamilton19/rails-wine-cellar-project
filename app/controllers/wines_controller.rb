class WinesController < ApplicationController
    before_action :authentication_required

  def new
    @wine = Wine.new(type_id: params[:type_id])
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.save!
    if @wine.save
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
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :year, :price, :type_id, :type_name)
  end

end
