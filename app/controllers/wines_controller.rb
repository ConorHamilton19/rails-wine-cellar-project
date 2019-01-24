class WinesController < ApplicationController

  def new
      @wine = Wine.new
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

  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :year, :price)
  end

end
