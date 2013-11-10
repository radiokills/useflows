class ShotsController < ApplicationController
  expose(:shot) { Shot.find(params[:id]) if params[:id].present? }

end
