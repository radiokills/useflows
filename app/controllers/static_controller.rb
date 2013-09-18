class StaticController < ApplicationController

  def admin
    redirect_to [:admin, :shots]
  end


  expose(:shots) do
    Shot.all

  end

  def home
  end

end
