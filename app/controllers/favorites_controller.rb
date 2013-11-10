class FavoritesController < ApplicationController
  expose(:shot) { Shot.find(params[:shot_id]) }

  def create
    current_user.shots.push shot
  end

  def destroy
    current_user.shots.destroy shot
  end

end
