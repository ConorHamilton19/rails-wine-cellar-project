class TypesController < ApplicationController

  def new
    @type = Type.new
  end

  def create
    @type = Type.create(type_params)
    if @type.save
      redirect_to type_path(@type)
    else
      render new_type_path
    end
  end

  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
  end 

  private

  def type_params
    params.require(:type).permit(:name, :region)
  end
end
