class Admin::ShotsController < Admin::BaseController

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

  def create
    if shot.save
      redirect_to [:admin, :shots], flash: {notice: "Shot updated."}
    else
      render :edit
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
    redirect_to [:admin, :shots]
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
