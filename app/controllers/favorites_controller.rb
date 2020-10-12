class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(reptile_id: params[:reptile_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @reptile = Reptile.find(params[:reptile_id])
    @favorite = current_user.favorites.find_by(reptile_id: @reptile.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
