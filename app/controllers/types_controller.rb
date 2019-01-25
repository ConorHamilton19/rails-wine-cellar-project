class TypesController < ApplicationController
  before_action :authentication_required

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
    @types = current_user.wines.map{|wine| wine.type}
  end

  def show
    @type = Type.find(params[:id])
  end

  private

  def type_params
    params.require(:type).permit(:name, :region)
  end
end
