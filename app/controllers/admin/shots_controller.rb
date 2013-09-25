class Admin::ShotsController < Admin::BaseController

 skip_before_filter :verify_authenticity_token, :only => [:create]

  expose(:shots){ Shot.all.page(params[:page]||1).per(params[:per]||20) }
  expose(:shot, attributes: :shot_params){
    if params[:id].present?
      Shot.all.find(params[:id])
    elsif params[:shot].present?
      Shot.new(shot_params)
    else
      Shot.new
    end
  }

  def index
  end

  def show
  end

  def toggle_visible
    shot.toggle_visible!

    respond_to do |f|
      f.html { redirect_to [:admin, :shots], flash: {notice:"Shot visibility has changed."} }
      f.js { render :index }
    end
  end

  def create
    if shot.save
      respond_to do |f|
        f.html { redirect_to [:admin, :shots], flash: {notice: "Shot updated."} }
        f.json { render json: shot }
      end
    else
      respond_to do |f|
        f.json { render json: shot.errors }
        f.html { render :edit }
      end
    end
  end

  def update
    if shot.update shot_params
      redirect_to [:admin, :shots], flash: {notice: "Shot updated."}
    else
      render :edit
    end
  end

  def destroy
    shot.destroy
    redirect_to [:admin, :shots], flash: {notice: "Shot was deleted."}
  end

  def edit
  end

  def new
  end

  private

  def shot_params
    params.require(:shot).permit!
  end


end
