class StaticController < ApplicationController

  respond_to "html"
  respond_to "js", only: [:create, :home]

  expose(:shots, attributes: :page_params) do
    if current_user && params[:users_only].present?
      shots = current_user.shots
    else
      shots = Shot.visible
    end
    shots = shots.tagged_with(params[:tag]) if params[:tag].present?
    shots.page(params[:page] || 1)
  end

  expose(:shot, attributes: :shot_params) do
    if params[:id].present?
      Shot.find(params[:id])
    elsif params[:shot].present?
      Shot.new(shot_params)
    else
      Shot.new
    end
  end

  def admin
    redirect_to [:admin, :shots]
  end

  def home
  end

  def create
    @submited = true
    if shot.save
      respond_to do |f|
        f.js { render "created" }
        f.html { redirect_to root_path, flash: {notice: "Shot created."} }
      end
    else
      respond_to do |f|
        f.js { render partial: "shots/form" }
        f.html { render "home", flash: {notice: "Error creating shot."} }
      end
    end
  end

  private

  def shot_params
    params.require(:shot).permit!
  end

  def page_params
    params.permit(:per, :page, :tag)
  end

end
