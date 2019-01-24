class WinesController < ApplicationController

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
  end

  def update
  end

  def destroy
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :year, :price, :type_id)
  end

end
