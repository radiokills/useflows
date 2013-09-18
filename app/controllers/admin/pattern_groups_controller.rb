class Admin::PatternGroupsController < Admin::BaseController


  expose(:pattern_groups){ PatternGroup.all.page(params[:page]||1).per(params[:per]||20) }
  expose(:pattern_group, attributes: :pattern_group_params){
    if params[:id].present?
      PatternGroup.all.find(params[:id])
    elsif params[:pattern_group].present?
      PatternGroup.new(pattern_group_params)
    else
      PatternGroup.new
    end
  }

  def index
  end

  def show
  end

  def create
    if pattern_group.save
      redirect_to [:admin, :pattern_groups]
    else
      render :edit
    end
  end

  def update
    if pattern_group.update pattern_group_params
      redirect_to [:admin, :pattern_groups]
    else
      render :edit
    end
  end

  def destroy
    pattern_group.destroy
    redirect_to [:admin, :pattern_groups]
  end

  def edit
  end

  def new
  end

  private

  def pattern_group_params
    params.require(:pattern_group).permit!
  end

end
