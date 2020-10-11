class ReptilesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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
    if @reptile.save
      redirect_to reptile_path(@reptile), notice: '投稿に成功しました。'
    else
      render 'new'
    end
  end

  def edit
    @reptile = Reptile.find(params[:id])
    if @reptile.user != current_user
      redirect_to reptiles_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @reptile = Reptile.find(params[:id])
    if @reptile.update(reptile_params)
      redirect_to reptile_path(@reptile), notice: '更新に成功しました。'
    else
      render 'edit'
    end
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
