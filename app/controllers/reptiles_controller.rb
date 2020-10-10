class ReptilesController < ApplicationController
  def index
    @reptiles = Reptile.all
  end

  def show
    @reptile = Reptile.find(params[:id])
  end

  def new
    @reptile = Reptile.new
  end
  def create
    @reptile = Reptile.new(reptile_params)
    @reptile.user_id = current_user.id
    @reptile.save
    redirect_to reptile_path(@reptile)
  end

  def edit
    @reptile = Reptile.find(params[:id])
  end

  def update
    @reptile = Reptile.find(params[:id])
    @reptile.update(reptile_params)
    redirect_to reptile_path(@reptile)
  end

  def destroy
    @reptile = Reptile.find(params[:id])
    @reptile.destroy
    redirect_to reptiles_path
  end

  private
  def reptile_params
  params.require(:reptile).permit(:title, :body, :image)
  end
end
