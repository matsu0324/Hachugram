class FavoritesController < ApplicationController
  def create
    @reptile = Reptile.find(params[:reptile_id])
    @favorite = current_user.favorites.create(reptile_id: params[:reptile_id])
  end

  def destroy
    @reptile = Reptile.find(params[:reptile_id])
    @favorite = current_user.favorites.find_by(reptile_id: @reptile.id)
    @favorite.destroy
  end
end
